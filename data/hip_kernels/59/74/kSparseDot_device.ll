; ModuleID = '../data/hip_kernels/59/74/main.cu'
source_filename = "../data/hip_kernels/59/74/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10kSparseDotiiiPfPiS0_S_S_ff(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture %7, float %8, float %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %27 = add i32 %25, %26
  %28 = icmp ult i32 %19, %0
  %29 = icmp ult i32 %27, %1
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %73

31:                                               ; preds = %10
  %32 = zext i32 %19 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = add nuw i32 %19, 1
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = icmp slt i32 %34, %38
  br i1 %39, label %40, label %42

40:                                               ; preds = %31
  %41 = mul i32 %27, %2
  br label %49

42:                                               ; preds = %49, %31
  %43 = phi float [ 0.000000e+00, %31 ], [ %62, %49 ]
  %44 = mul i32 %27, %0
  %45 = add i32 %44, %19
  %46 = fmul contract float %43, %9
  %47 = fcmp contract oeq float %8, 0.000000e+00
  %48 = sext i32 %45 to i64
  br i1 %47, label %69, label %65

49:                                               ; preds = %40, %49
  %50 = phi float [ 0.000000e+00, %40 ], [ %62, %49 ]
  %51 = phi i32 [ %34, %40 ], [ %63, %49 ]
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %3, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !11, !amdgpu.noclobber !5
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %52
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = add i32 %56, %41
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %6, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !11, !amdgpu.noclobber !5
  %61 = fmul contract float %54, %60
  %62 = fadd contract float %50, %61
  %63 = add nsw i32 %51, 1
  %64 = icmp slt i32 %63, %38
  br i1 %64, label %49, label %42, !llvm.loop !13

65:                                               ; preds = %42
  %66 = getelementptr inbounds float, float addrspace(1)* %7, i64 %48
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !11, !amdgpu.noclobber !5
  %68 = fmul contract float %67, %8
  br label %69

69:                                               ; preds = %42, %65
  %70 = phi contract float [ %68, %65 ], [ 0.000000e+00, %42 ]
  %71 = fadd contract float %46, %70
  %72 = getelementptr inbounds float, float addrspace(1)* %7, i64 %48
  store float %71, float addrspace(1)* %72, align 4, !tbaa !11
  br label %73

73:                                               ; preds = %69, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
