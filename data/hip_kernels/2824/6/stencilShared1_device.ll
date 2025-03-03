; ModuleID = '../data/hip_kernels/2824/6/main.cu'
source_filename = "../data/hip_kernels/2824/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@const_stencilWeight = protected addrspace(4) externally_initialized global [10000 x float] zeroinitializer, align 16
@_ZZ14stencilShared1PfS_iiE6buffer = internal unnamed_addr addrspace(3) global [1035 x float] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([10000 x float] addrspace(4)* @const_stencilWeight to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14stencilShared1PfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  br label %18

14:                                               ; preds = %18
  %15 = add nsw i32 %3, 1
  %16 = add nsw i32 %15, %13
  %17 = icmp slt i32 %16, %2
  br i1 %17, label %27, label %148

18:                                               ; preds = %4, %18
  %19 = phi i32 [ %12, %4 ], [ %25, %18 ]
  %20 = add nsw i32 %19, %13
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared1PfS_iiE6buffer, i32 0, i32 %19
  store float %23, float addrspace(3)* %24, align 4, !tbaa !7
  %25 = add nuw nsw i32 %19, 1024
  %26 = icmp ult i32 %19, 21
  br i1 %26, label %18, label %14, !llvm.loop !11

27:                                               ; preds = %14
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = sub nsw i32 0, %3
  %29 = icmp sgt i32 %3, 0
  br i1 %29, label %30, label %60

30:                                               ; preds = %27
  %31 = sub nsw i32 1, %3
  %32 = tail call i32 @llvm.smax.i32(i32 %3, i32 %31)
  %33 = add nuw i32 %32, %3
  %34 = add i32 %33, -1
  %35 = and i32 %33, 7
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %55, label %37

37:                                               ; preds = %30, %37
  %38 = phi i32 [ %50, %37 ], [ %28, %30 ]
  %39 = phi float [ %49, %37 ], [ 0.000000e+00, %30 ]
  %40 = phi i32 [ %51, %37 ], [ 0, %30 ]
  %41 = add i32 %38, %3
  %42 = add nuw nsw i32 %41, %12
  %43 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared1PfS_iiE6buffer, i32 0, i32 %42
  %44 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %45 = sext i32 %41 to i64
  %46 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %45
  %47 = load float, float addrspace(4)* %46, align 4, !tbaa !7
  %48 = fmul contract float %44, %47
  %49 = fadd contract float %39, %48
  %50 = add nsw i32 %38, 1
  %51 = add nuw nsw i32 %40, 1
  %52 = icmp eq i32 %51, %35
  br i1 %52, label %53, label %37, !llvm.loop !13

53:                                               ; preds = %37
  %54 = sub i32 %35, %3
  br label %55

55:                                               ; preds = %53, %30
  %56 = phi i32 [ %28, %30 ], [ %54, %53 ]
  %57 = phi float [ 0.000000e+00, %30 ], [ %49, %53 ]
  %58 = phi float [ undef, %30 ], [ %49, %53 ]
  %59 = icmp ult i32 %34, 7
  br i1 %59, label %60, label %64

60:                                               ; preds = %64, %55, %27
  %61 = phi float [ 0.000000e+00, %27 ], [ %58, %55 ], [ %145, %64 ]
  %62 = sext i32 %16 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  store float %61, float addrspace(1)* %63, align 4, !tbaa !7
  br label %148

64:                                               ; preds = %55, %64
  %65 = phi i32 [ %146, %64 ], [ %56, %55 ]
  %66 = phi float [ %145, %64 ], [ %57, %55 ]
  %67 = add i32 %65, %3
  %68 = add i32 %67, %12
  %69 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared1PfS_iiE6buffer, i32 0, i32 %68
  %70 = load float, float addrspace(3)* %69, align 4, !tbaa !7
  %71 = sext i32 %67 to i64
  %72 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %71
  %73 = load float, float addrspace(4)* %72, align 4, !tbaa !7
  %74 = fmul contract float %70, %73
  %75 = fadd contract float %66, %74
  %76 = add nsw i32 %65, 1
  %77 = add i32 %76, %3
  %78 = add i32 %77, %12
  %79 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared1PfS_iiE6buffer, i32 0, i32 %78
  %80 = load float, float addrspace(3)* %79, align 4, !tbaa !7
  %81 = sext i32 %77 to i64
  %82 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %81
  %83 = load float, float addrspace(4)* %82, align 4, !tbaa !7
  %84 = fmul contract float %80, %83
  %85 = fadd contract float %75, %84
  %86 = add nsw i32 %65, 2
  %87 = add i32 %86, %3
  %88 = add i32 %87, %12
  %89 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared1PfS_iiE6buffer, i32 0, i32 %88
  %90 = load float, float addrspace(3)* %89, align 4, !tbaa !7
  %91 = sext i32 %87 to i64
  %92 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %91
  %93 = load float, float addrspace(4)* %92, align 4, !tbaa !7
  %94 = fmul contract float %90, %93
  %95 = fadd contract float %85, %94
  %96 = add nsw i32 %65, 3
  %97 = add i32 %96, %3
  %98 = add i32 %97, %12
  %99 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared1PfS_iiE6buffer, i32 0, i32 %98
  %100 = load float, float addrspace(3)* %99, align 4, !tbaa !7
  %101 = sext i32 %97 to i64
  %102 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %101
  %103 = load float, float addrspace(4)* %102, align 4, !tbaa !7
  %104 = fmul contract float %100, %103
  %105 = fadd contract float %95, %104
  %106 = add nsw i32 %65, 4
  %107 = add i32 %106, %3
  %108 = add i32 %107, %12
  %109 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared1PfS_iiE6buffer, i32 0, i32 %108
  %110 = load float, float addrspace(3)* %109, align 4, !tbaa !7
  %111 = sext i32 %107 to i64
  %112 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %111
  %113 = load float, float addrspace(4)* %112, align 4, !tbaa !7
  %114 = fmul contract float %110, %113
  %115 = fadd contract float %105, %114
  %116 = add nsw i32 %65, 5
  %117 = add i32 %116, %3
  %118 = add i32 %117, %12
  %119 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared1PfS_iiE6buffer, i32 0, i32 %118
  %120 = load float, float addrspace(3)* %119, align 4, !tbaa !7
  %121 = sext i32 %117 to i64
  %122 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %121
  %123 = load float, float addrspace(4)* %122, align 4, !tbaa !7
  %124 = fmul contract float %120, %123
  %125 = fadd contract float %115, %124
  %126 = add nsw i32 %65, 6
  %127 = add i32 %126, %3
  %128 = add i32 %127, %12
  %129 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared1PfS_iiE6buffer, i32 0, i32 %128
  %130 = load float, float addrspace(3)* %129, align 4, !tbaa !7
  %131 = sext i32 %127 to i64
  %132 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %131
  %133 = load float, float addrspace(4)* %132, align 4, !tbaa !7
  %134 = fmul contract float %130, %133
  %135 = fadd contract float %125, %134
  %136 = add nsw i32 %65, 7
  %137 = add i32 %136, %3
  %138 = add i32 %137, %12
  %139 = getelementptr inbounds [1035 x float], [1035 x float] addrspace(3)* @_ZZ14stencilShared1PfS_iiE6buffer, i32 0, i32 %138
  %140 = load float, float addrspace(3)* %139, align 4, !tbaa !7
  %141 = sext i32 %137 to i64
  %142 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %141
  %143 = load float, float addrspace(4)* %142, align 4, !tbaa !7
  %144 = fmul contract float %140, %143
  %145 = fadd contract float %135, %144
  %146 = add nsw i32 %65, 8
  %147 = icmp slt i32 %146, %3
  br i1 %147, label %64, label %60, !llvm.loop !15

148:                                              ; preds = %14, %60
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
