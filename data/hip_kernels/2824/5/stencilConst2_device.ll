; ModuleID = '../data/hip_kernels/2824/5/main.cu'
source_filename = "../data/hip_kernels/2824/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@const_stencilWeight = protected addrspace(4) externally_initialized global [10000 x float] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([10000 x float] addrspace(4)* @const_stencilWeight to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13stencilConst2PfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add nuw nsw i32 %12, 1
  %14 = add i32 %13, %3
  %15 = add i32 %14, %11
  %16 = icmp slt i32 %15, %2
  br i1 %16, label %17, label %147

17:                                               ; preds = %4
  %18 = sub nsw i32 0, %3
  %19 = icmp sgt i32 %3, 0
  br i1 %19, label %20, label %51

20:                                               ; preds = %17
  %21 = sub nsw i32 1, %3
  %22 = tail call i32 @llvm.smax.i32(i32 %3, i32 %21)
  %23 = add nuw i32 %22, %3
  %24 = add i32 %23, -1
  %25 = and i32 %23, 7
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %46, label %27

27:                                               ; preds = %20, %27
  %28 = phi i32 [ %41, %27 ], [ %18, %20 ]
  %29 = phi float [ %40, %27 ], [ 0.000000e+00, %20 ]
  %30 = phi i32 [ %42, %27 ], [ 0, %20 ]
  %31 = add nsw i32 %28, %15
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = add nsw i32 %28, %3
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %36
  %38 = load float, float addrspace(4)* %37, align 4, !tbaa !7
  %39 = fmul contract float %34, %38
  %40 = fadd contract float %29, %39
  %41 = add nsw i32 %28, 1
  %42 = add nuw nsw i32 %30, 1
  %43 = icmp eq i32 %42, %25
  br i1 %43, label %44, label %27, !llvm.loop !11

44:                                               ; preds = %27
  %45 = sub i32 %25, %3
  br label %46

46:                                               ; preds = %44, %20
  %47 = phi i32 [ %18, %20 ], [ %45, %44 ]
  %48 = phi float [ 0.000000e+00, %20 ], [ %40, %44 ]
  %49 = phi float [ undef, %20 ], [ %40, %44 ]
  %50 = icmp ult i32 %24, 7
  br i1 %50, label %51, label %55

51:                                               ; preds = %55, %46, %17
  %52 = phi float [ 0.000000e+00, %17 ], [ %49, %46 ], [ %144, %55 ]
  %53 = sext i32 %15 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  store float %52, float addrspace(1)* %54, align 4, !tbaa !7
  br label %147

55:                                               ; preds = %46, %55
  %56 = phi i32 [ %145, %55 ], [ %47, %46 ]
  %57 = phi float [ %144, %55 ], [ %48, %46 ]
  %58 = add nsw i32 %56, %15
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = add nsw i32 %56, %3
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %63
  %65 = load float, float addrspace(4)* %64, align 4, !tbaa !7
  %66 = fmul contract float %61, %65
  %67 = fadd contract float %57, %66
  %68 = add nsw i32 %56, 1
  %69 = add nsw i32 %68, %15
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = add nsw i32 %68, %3
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %74
  %76 = load float, float addrspace(4)* %75, align 4, !tbaa !7
  %77 = fmul contract float %72, %76
  %78 = fadd contract float %67, %77
  %79 = add nsw i32 %56, 2
  %80 = add nsw i32 %79, %15
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  %84 = add nsw i32 %79, %3
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %85
  %87 = load float, float addrspace(4)* %86, align 4, !tbaa !7
  %88 = fmul contract float %83, %87
  %89 = fadd contract float %78, %88
  %90 = add nsw i32 %56, 3
  %91 = add nsw i32 %90, %15
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = add nsw i32 %90, %3
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %96
  %98 = load float, float addrspace(4)* %97, align 4, !tbaa !7
  %99 = fmul contract float %94, %98
  %100 = fadd contract float %89, %99
  %101 = add nsw i32 %56, 4
  %102 = add nsw i32 %101, %15
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  %106 = add nsw i32 %101, %3
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %107
  %109 = load float, float addrspace(4)* %108, align 4, !tbaa !7
  %110 = fmul contract float %105, %109
  %111 = fadd contract float %100, %110
  %112 = add nsw i32 %56, 5
  %113 = add nsw i32 %112, %15
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = add nsw i32 %112, %3
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %118
  %120 = load float, float addrspace(4)* %119, align 4, !tbaa !7
  %121 = fmul contract float %116, %120
  %122 = fadd contract float %111, %121
  %123 = add nsw i32 %56, 6
  %124 = add nsw i32 %123, %15
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !5
  %128 = add nsw i32 %123, %3
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %129
  %131 = load float, float addrspace(4)* %130, align 4, !tbaa !7
  %132 = fmul contract float %127, %131
  %133 = fadd contract float %122, %132
  %134 = add nsw i32 %56, 7
  %135 = add nsw i32 %134, %15
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !5
  %139 = add nsw i32 %134, %3
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [10000 x float], [10000 x float] addrspace(4)* @const_stencilWeight, i64 0, i64 %140
  %142 = load float, float addrspace(4)* %141, align 4, !tbaa !7
  %143 = fmul contract float %138, %142
  %144 = fadd contract float %133, %143
  %145 = add nsw i32 %56, 8
  %146 = icmp slt i32 %145, %3
  br i1 %146, label %55, label %51, !llvm.loop !13

147:                                              ; preds = %4, %51
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14, !12}
!14 = !{!"llvm.loop.mustprogress"}
