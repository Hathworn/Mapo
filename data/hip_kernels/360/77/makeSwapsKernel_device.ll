; ModuleID = '../data/hip_kernels/360/77/main.cu'
source_filename = "../data/hip_kernels/360/77/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z15makeSwapsKerneliPiS_S_S_S_S_Pf(i32 %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = add nsw i32 %0, -1
  %19 = icmp eq i32 %17, %18
  br i1 %19, label %20, label %29

20:                                               ; preds = %8
  %21 = sext i32 %17 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %7, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = fpext float %23 to double
  %25 = fcmp contract ogt double %24, 1.000000e-01
  br i1 %25, label %26, label %63

26:                                               ; preds = %20
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %21
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %45

29:                                               ; preds = %8
  %30 = icmp slt i32 %17, %18
  br i1 %30, label %31, label %63

31:                                               ; preds = %29
  %32 = sext i32 %17 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %7, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = fpext float %34 to double
  %36 = fcmp contract ogt double %35, 1.000000e-01
  br i1 %36, label %37, label %63

37:                                               ; preds = %31
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %32
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !11, !amdgpu.noclobber !5
  %40 = add nsw i32 %17, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !11, !amdgpu.noclobber !5
  %44 = icmp eq i32 %39, %43
  br i1 %44, label %63, label %45

45:                                               ; preds = %37, %26
  %46 = phi i64 [ %21, %26 ], [ %32, %37 ]
  %47 = phi i32 [ %28, %26 ], [ %39, %37 ]
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %46
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !11
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %46
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !11
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %50
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !11
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  store i32 %52, i32 addrspace(1)* %55, align 4, !tbaa !11
  %56 = sext i32 %52 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %56
  %58 = atomicrmw add i32 addrspace(1)* %57, i32 %54 syncscope("agent-one-as") monotonic, align 4
  %59 = sext i32 %47 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %59
  %61 = sub nsw i32 0, %54
  %62 = atomicrmw add i32 addrspace(1)* %60, i32 %61 syncscope("agent-one-as") monotonic, align 4
  br label %63

63:                                               ; preds = %45, %29, %37, %31, %20
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
