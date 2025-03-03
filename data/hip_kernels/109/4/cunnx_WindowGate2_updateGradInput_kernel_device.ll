; ModuleID = '../data/hip_kernels/109/4/main.cu'
source_filename = "../data/hip_kernels/109/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z40cunnx_WindowGate2_updateGradInput_kernelPfS_S_PKfS1_S1_S1_S1_S1_iiiiiffff(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readnone %1, float addrspace(1)* nocapture readnone %2, float addrspace(1)* nocapture readnone %3, float addrspace(1)* nocapture readnone %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readnone %6, float addrspace(1)* nocapture readnone %7, float addrspace(1)* nocapture readonly %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, float %14, float %15, float %16, float %17) local_unnamed_addr #0 {
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = mul i32 %20, %12
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %8, i64 %22
  %24 = mul i32 %20, %9
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = zext i32 %20 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %5, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  %30 = fadd contract float %29, -1.000000e+00
  %31 = fptosi float %30 to i32
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %26, i64 %32
  %34 = icmp slt i32 %19, %11
  br i1 %34, label %35, label %46

35:                                               ; preds = %18
  %36 = icmp sgt i32 %13, 0
  %37 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %38 = getelementptr i8, i8 addrspace(4)* %37, i64 4
  %39 = bitcast i8 addrspace(4)* %38 to i16 addrspace(4)*
  %40 = load i16, i16 addrspace(4)* %39, align 4, !range !10, !invariant.load !9
  %41 = zext i16 %40 to i32
  %42 = and i32 %13, 7
  %43 = icmp ult i32 %13, 8
  %44 = and i32 %13, -8
  %45 = icmp eq i32 %42, 0
  br label %47

46:                                               ; preds = %68, %18
  ret void

47:                                               ; preds = %35, %68
  %48 = phi i32 [ %19, %35 ], [ %74, %68 ]
  %49 = mul nsw i32 %48, %13
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %23, i64 %50
  br i1 %36, label %52, label %68

52:                                               ; preds = %47
  br i1 %43, label %53, label %76

53:                                               ; preds = %76, %52
  %54 = phi float [ undef, %52 ], [ %118, %76 ]
  %55 = phi i32 [ 0, %52 ], [ %119, %76 ]
  %56 = phi float [ 0.000000e+00, %52 ], [ %118, %76 ]
  br i1 %45, label %68, label %57

57:                                               ; preds = %53, %57
  %58 = phi i32 [ %65, %57 ], [ %55, %53 ]
  %59 = phi float [ %64, %57 ], [ %56, %53 ]
  %60 = phi i32 [ %66, %57 ], [ 0, %53 ]
  %61 = zext i32 %58 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %51, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !5
  %64 = fadd contract float %59, %63
  %65 = add nuw nsw i32 %58, 1
  %66 = add i32 %60, 1
  %67 = icmp eq i32 %66, %42
  br i1 %67, label %68, label %57, !llvm.loop !11

68:                                               ; preds = %53, %57, %47
  %69 = phi float [ 0.000000e+00, %47 ], [ %54, %53 ], [ %64, %57 ]
  %70 = sext i32 %48 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %33, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5
  %73 = fadd contract float %69, %72
  store float %73, float addrspace(1)* %71, align 4, !tbaa !5
  %74 = add i32 %48, %41
  %75 = icmp slt i32 %74, %11
  br i1 %75, label %47, label %46, !llvm.loop !13

76:                                               ; preds = %52, %76
  %77 = phi i32 [ %119, %76 ], [ 0, %52 ]
  %78 = phi float [ %118, %76 ], [ 0.000000e+00, %52 ]
  %79 = phi i32 [ %120, %76 ], [ 0, %52 ]
  %80 = zext i32 %77 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %51, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5
  %83 = fadd contract float %78, %82
  %84 = or i32 %77, 1
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %51, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5
  %88 = fadd contract float %83, %87
  %89 = or i32 %77, 2
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %51, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5
  %93 = fadd contract float %88, %92
  %94 = or i32 %77, 3
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %51, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !5
  %98 = fadd contract float %93, %97
  %99 = or i32 %77, 4
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %51, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5
  %103 = fadd contract float %98, %102
  %104 = or i32 %77, 5
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %51, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !5
  %108 = fadd contract float %103, %107
  %109 = or i32 %77, 6
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %51, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !5
  %113 = fadd contract float %108, %112
  %114 = or i32 %77, 7
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %51, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !5
  %118 = fadd contract float %113, %117
  %119 = add nuw nsw i32 %77, 8
  %120 = add i32 %79, 8
  %121 = icmp eq i32 %120, %44
  br i1 %121, label %53, label %76, !llvm.loop !15
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
