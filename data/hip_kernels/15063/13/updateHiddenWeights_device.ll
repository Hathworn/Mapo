; ModuleID = '../data/hip_kernels/15063/13/main.cu'
source_filename = "../data/hip_kernels/15063/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19updateHiddenWeightsPfffiS_iiS_S_(float addrspace(1)* nocapture %0, float %1, float %2, i32 %3, float addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, float addrspace(1)* nocapture %7, float addrspace(1)* nocapture readonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = mul i32 %16, %15
  %18 = add i32 %17, %10
  %19 = icmp sgt i32 %5, 0
  br i1 %19, label %22, label %20

20:                                               ; preds = %9
  %21 = sext i32 %18 to i64
  br label %64

22:                                               ; preds = %9
  %23 = fmul contract float %1, %2
  %24 = mul nsw i32 %18, %6
  %25 = add nsw i32 %24, %3
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %4, i64 %26
  %28 = sext i32 %18 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %8, i64 %28
  %30 = mul nsw i32 %18, %5
  %31 = and i32 %5, 3
  %32 = icmp ult i32 %5, 4
  br i1 %32, label %35, label %33

33:                                               ; preds = %22
  %34 = and i32 %5, -4
  br label %70

35:                                               ; preds = %70, %22
  %36 = phi float [ undef, %22 ], [ %125, %70 ]
  %37 = phi float [ 0.000000e+00, %22 ], [ %125, %70 ]
  %38 = phi i32 [ 0, %22 ], [ %133, %70 ]
  %39 = icmp eq i32 %31, 0
  br i1 %39, label %61, label %40

40:                                               ; preds = %35, %40
  %41 = phi float [ %50, %40 ], [ %37, %35 ]
  %42 = phi i32 [ %58, %40 ], [ %38, %35 ]
  %43 = phi i32 [ %59, %40 ], [ 0, %35 ]
  %44 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %45 = fmul contract float %23, %44
  %46 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %47 = fmul contract float %46, 2.000000e+00
  %48 = fadd contract float %47, -1.000000e+00
  %49 = fmul contract float %45, %48
  %50 = fadd contract float %41, %49
  %51 = add nsw i32 %42, %30
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %55 = fadd contract float %54, %49
  %56 = tail call float @llvm.minnum.f32(float %55, float 1.000000e+00)
  %57 = tail call float @llvm.maxnum.f32(float %56, float 0.000000e+00)
  store float %57, float addrspace(1)* %53, align 4, !tbaa !7
  %58 = add nuw nsw i32 %42, 1
  %59 = add i32 %43, 1
  %60 = icmp eq i32 %59, %31
  br i1 %60, label %61, label %40, !llvm.loop !11

61:                                               ; preds = %40, %35
  %62 = phi float [ %36, %35 ], [ %50, %40 ]
  %63 = fmul contract float %62, 5.000000e-01
  br label %64

64:                                               ; preds = %20, %61
  %65 = phi i64 [ %21, %20 ], [ %28, %61 ]
  %66 = phi float [ 0.000000e+00, %20 ], [ %63, %61 ]
  %67 = getelementptr inbounds float, float addrspace(1)* %7, i64 %65
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = fsub contract float %68, %66
  store float %69, float addrspace(1)* %67, align 4, !tbaa !7
  ret void

70:                                               ; preds = %70, %33
  %71 = phi float [ 0.000000e+00, %33 ], [ %125, %70 ]
  %72 = phi i32 [ 0, %33 ], [ %133, %70 ]
  %73 = phi i32 [ 0, %33 ], [ %134, %70 ]
  %74 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %75 = fmul contract float %23, %74
  %76 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %77 = fmul contract float %76, 2.000000e+00
  %78 = fadd contract float %77, -1.000000e+00
  %79 = fmul contract float %75, %78
  %80 = fadd contract float %71, %79
  %81 = add nsw i32 %72, %30
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %85 = fadd contract float %84, %79
  %86 = tail call float @llvm.minnum.f32(float %85, float 1.000000e+00)
  %87 = tail call float @llvm.maxnum.f32(float %86, float 0.000000e+00)
  store float %87, float addrspace(1)* %83, align 4, !tbaa !7
  %88 = or i32 %72, 1
  %89 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %90 = fmul contract float %23, %89
  %91 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %92 = fmul contract float %91, 2.000000e+00
  %93 = fadd contract float %92, -1.000000e+00
  %94 = fmul contract float %90, %93
  %95 = fadd contract float %80, %94
  %96 = add nsw i32 %88, %30
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7
  %100 = fadd contract float %99, %94
  %101 = tail call float @llvm.minnum.f32(float %100, float 1.000000e+00)
  %102 = tail call float @llvm.maxnum.f32(float %101, float 0.000000e+00)
  store float %102, float addrspace(1)* %98, align 4, !tbaa !7
  %103 = or i32 %72, 2
  %104 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %105 = fmul contract float %23, %104
  %106 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %107 = fmul contract float %106, 2.000000e+00
  %108 = fadd contract float %107, -1.000000e+00
  %109 = fmul contract float %105, %108
  %110 = fadd contract float %95, %109
  %111 = add nsw i32 %103, %30
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7
  %115 = fadd contract float %114, %109
  %116 = tail call float @llvm.minnum.f32(float %115, float 1.000000e+00)
  %117 = tail call float @llvm.maxnum.f32(float %116, float 0.000000e+00)
  store float %117, float addrspace(1)* %113, align 4, !tbaa !7
  %118 = or i32 %72, 3
  %119 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %120 = fmul contract float %23, %119
  %121 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %122 = fmul contract float %121, 2.000000e+00
  %123 = fadd contract float %122, -1.000000e+00
  %124 = fmul contract float %120, %123
  %125 = fadd contract float %110, %124
  %126 = add nsw i32 %118, %30
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7
  %130 = fadd contract float %129, %124
  %131 = tail call float @llvm.minnum.f32(float %130, float 1.000000e+00)
  %132 = tail call float @llvm.maxnum.f32(float %131, float 0.000000e+00)
  store float %132, float addrspace(1)* %128, align 4, !tbaa !7
  %133 = add nuw nsw i32 %72, 4
  %134 = add i32 %73, 4
  %135 = icmp eq i32 %134, %34
  br i1 %135, label %35, label %70, !llvm.loop !13
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
