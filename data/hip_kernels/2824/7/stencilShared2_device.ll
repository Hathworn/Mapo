; ModuleID = '../data/hip_kernels/2824/7/main.cu'
source_filename = "../data/hip_kernels/2824/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@const_stencilWeight = protected addrspace(4) externally_initialized global [10000 x float] zeroinitializer, align 16
@_ZZ14stencilShared2PfS_iiE6buffer = internal unnamed_addr addrspace(3) global [1035 x float] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([10000 x float] addrspace(4)* @const_stencilWeight to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14stencilShared2PfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  br label %17

14:                                               ; preds = %17
  %15 = add nsw i32 %13, %3
  %16 = icmp slt i32 %15, %2
  br i1 %16, label %26, label %147

17:                                               ; preds = %4, %17
  %18 = phi i32 [ %12, %4 ], [ %24, %17 ]
  %19 = add nsw i32 %18, %13
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iiE6buffer, i32 0, i32 %18
  store float %22, float addrspace(3)* %23, align 4, !tbaa !7
  %24 = add nuw nsw i32 %18, 1024
  %25 = icmp ult i32 %18, 21
  br i1 %25, label %17, label %14, !llvm.loop !11

26:                                               ; preds = %14
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = sub nsw i32 0, %3
  %28 = icmp sgt i32 %3, 0
  br i1 %28, label %29, label %59

29:                                               ; preds = %26
  %30 = sub nsw i32 1, %3
  %31 = tail call i32 @llvm.smax.i32(i32 %3, i32 %30)
  %32 = add nuw i32 %31, %3
  %33 = add i32 %32, -1
  %34 = and i32 %32, 7
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %54, label %36

36:                                               ; preds = %29, %36
  %37 = phi i32 [ %49, %36 ], [ %27, %29 ]
  %38 = phi float [ %48, %36 ], [ 0.000000e+00, %29 ]
  %39 = phi i32 [ %50, %36 ], [ 0, %29 ]
  %40 = add i32 %37, %3
  %41 = add nuw nsw i32 %40, %12
  %42 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iiE6buffer, i32 0, i32 %41
  %43 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %44 = sext i32 %40 to i64
  %45 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %44
  %46 = load float, float addrspace(4)* %45, align 4, !tbaa !7
  %47 = fmul contract float %43, %46
  %48 = fadd contract float %38, %47
  %49 = add nsw i32 %37, 1
  %50 = add nuw nsw i32 %39, 1
  %51 = icmp eq i32 %50, %34
  br i1 %51, label %52, label %36, !llvm.loop !13

52:                                               ; preds = %36
  %53 = sub i32 %34, %3
  br label %54

54:                                               ; preds = %52, %29
  %55 = phi i32 [ %27, %29 ], [ %53, %52 ]
  %56 = phi float [ 0.000000e+00, %29 ], [ %48, %52 ]
  %57 = phi float [ undef, %29 ], [ %48, %52 ]
  %58 = icmp ult i32 %33, 7
  br i1 %58, label %59, label %63

59:                                               ; preds = %63, %54, %26
  %60 = phi float [ 0.000000e+00, %26 ], [ %57, %54 ], [ %144, %63 ]
  %61 = sext i32 %15 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  store float %60, float addrspace(1)* %62, align 4, !tbaa !7
  br label %147

63:                                               ; preds = %54, %63
  %64 = phi i32 [ %145, %63 ], [ %55, %54 ]
  %65 = phi float [ %144, %63 ], [ %56, %54 ]
  %66 = add i32 %64, %3
  %67 = add i32 %66, %12
  %68 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iiE6buffer, i32 0, i32 %67
  %69 = load float, float addrspace(3)* %68, align 4, !tbaa !7
  %70 = sext i32 %66 to i64
  %71 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %70
  %72 = load float, float addrspace(4)* %71, align 4, !tbaa !7
  %73 = fmul contract float %69, %72
  %74 = fadd contract float %65, %73
  %75 = add nsw i32 %64, 1
  %76 = add i32 %75, %3
  %77 = add i32 %76, %12
  %78 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iiE6buffer, i32 0, i32 %77
  %79 = load float, float addrspace(3)* %78, align 4, !tbaa !7
  %80 = sext i32 %76 to i64
  %81 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %80
  %82 = load float, float addrspace(4)* %81, align 4, !tbaa !7
  %83 = fmul contract float %79, %82
  %84 = fadd contract float %74, %83
  %85 = add nsw i32 %64, 2
  %86 = add i32 %85, %3
  %87 = add i32 %86, %12
  %88 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iiE6buffer, i32 0, i32 %87
  %89 = load float, float addrspace(3)* %88, align 4, !tbaa !7
  %90 = sext i32 %86 to i64
  %91 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %90
  %92 = load float, float addrspace(4)* %91, align 4, !tbaa !7
  %93 = fmul contract float %89, %92
  %94 = fadd contract float %84, %93
  %95 = add nsw i32 %64, 3
  %96 = add i32 %95, %3
  %97 = add i32 %96, %12
  %98 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iiE6buffer, i32 0, i32 %97
  %99 = load float, float addrspace(3)* %98, align 4, !tbaa !7
  %100 = sext i32 %96 to i64
  %101 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %100
  %102 = load float, float addrspace(4)* %101, align 4, !tbaa !7
  %103 = fmul contract float %99, %102
  %104 = fadd contract float %94, %103
  %105 = add nsw i32 %64, 4
  %106 = add i32 %105, %3
  %107 = add i32 %106, %12
  %108 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iiE6buffer, i32 0, i32 %107
  %109 = load float, float addrspace(3)* %108, align 4, !tbaa !7
  %110 = sext i32 %106 to i64
  %111 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %110
  %112 = load float, float addrspace(4)* %111, align 4, !tbaa !7
  %113 = fmul contract float %109, %112
  %114 = fadd contract float %104, %113
  %115 = add nsw i32 %64, 5
  %116 = add i32 %115, %3
  %117 = add i32 %116, %12
  %118 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iiE6buffer, i32 0, i32 %117
  %119 = load float, float addrspace(3)* %118, align 4, !tbaa !7
  %120 = sext i32 %116 to i64
  %121 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %120
  %122 = load float, float addrspace(4)* %121, align 4, !tbaa !7
  %123 = fmul contract float %119, %122
  %124 = fadd contract float %114, %123
  %125 = add nsw i32 %64, 6
  %126 = add i32 %125, %3
  %127 = add i32 %126, %12
  %128 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iiE6buffer, i32 0, i32 %127
  %129 = load float, float addrspace(3)* %128, align 4, !tbaa !7
  %130 = sext i32 %126 to i64
  %131 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %130
  %132 = load float, float addrspace(4)* %131, align 4, !tbaa !7
  %133 = fmul contract float %129, %132
  %134 = fadd contract float %124, %133
  %135 = add nsw i32 %64, 7
  %136 = add i32 %135, %3
  %137 = add i32 %136, %12
  %138 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared2PfS_iiE6buffer, i32 0, i32 %137
  %139 = load float, float addrspace(3)* %138, align 4, !tbaa !7
  %140 = sext i32 %136 to i64
  %141 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %140
  %142 = load float, float addrspace(4)* %141, align 4, !tbaa !7
  %143 = fmul contract float %139, %142
  %144 = fadd contract float %134, %143
  %145 = add nsw i32 %64, 8
  %146 = icmp slt i32 %145, %3
  br i1 %146, label %63, label %59, !llvm.loop !15

147:                                              ; preds = %14, %59
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12, !14}
