; ModuleID = '../data/hip_kernels/11329/1/main.cu'
source_filename = "../data/hip_kernels/11329/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24ForwardEliminationColumnPdPiS0_S0_S0_(double addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4, !amdgpu.noclobber !8
  %7 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !4, !amdgpu.noclobber !8
  %8 = load i32, i32 addrspace(1)* %3, align 4, !tbaa !4, !amdgpu.noclobber !8
  %9 = load i32, i32 addrspace(1)* %4, align 4, !tbaa !4, !amdgpu.noclobber !8
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !9, !invariant.load !8
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !10
  %18 = add i32 %16, %17
  %19 = mul i32 %18, %8
  %20 = add nsw i32 %6, 1
  %21 = mul nsw i32 %9, %20
  %22 = add nsw i32 %21, %9
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds double, double addrspace(1)* %0, i64 %23
  %25 = load double, double addrspace(1)* %24, align 8, !tbaa !11, !amdgpu.noclobber !8
  %26 = mul nsw i32 %7, %20
  %27 = add nsw i32 %9, %26
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %0, i64 %28
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !11, !amdgpu.noclobber !8
  %31 = fdiv contract double %30, %25
  %32 = icmp sgt i32 %8, 0
  br i1 %32, label %34, label %33

33:                                               ; preds = %49, %5
  ret void

34:                                               ; preds = %5, %49
  %35 = phi i32 [ %50, %49 ], [ 0, %5 ]
  %36 = add i32 %35, %19
  %37 = icmp sgt i32 %36, %6
  br i1 %37, label %49, label %38

38:                                               ; preds = %34
  %39 = add i32 %36, %21
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %0, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !11
  %43 = fmul contract double %31, %42
  %44 = add i32 %36, %26
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds double, double addrspace(1)* %0, i64 %45
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !11
  %48 = fsub contract double %47, %43
  store double %48, double addrspace(1)* %46, align 8, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %49

49:                                               ; preds = %34, %38
  %50 = add nuw nsw i32 %35, 1
  %51 = icmp eq i32 %50, %8
  br i1 %51, label %33, label %34, !llvm.loop !13
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i16 1, i16 1025}
!10 = !{i32 0, i32 1024}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !6, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
