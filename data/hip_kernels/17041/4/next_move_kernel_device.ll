; ModuleID = '../data/hip_kernels/17041/4/main.cu'
source_filename = "../data/hip_kernels/17041/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z16next_move_kernelPiS_S_S_PdS0_S_S_iid(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, i32 %8, i32 %9, double %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %28 = add i32 %26, %27
  %29 = mul nsw i32 %28, %8
  %30 = add nsw i32 %29, %20
  %31 = icmp slt i32 %20, %8
  %32 = icmp slt i32 %28, %9
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %96

34:                                               ; preds = %11
  %35 = sext i32 %30 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = add nsw i32 %30, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7
  %42 = icmp slt i32 %37, %41
  br i1 %42, label %43, label %96

43:                                               ; preds = %34
  %44 = getelementptr inbounds double, double addrspace(1)* %5, i64 %35
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %35
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %35
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %35
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7
  br label %50

50:                                               ; preds = %43, %50
  %51 = phi i32 [ %49, %43 ], [ %92, %50 ]
  %52 = phi i32 [ %37, %43 ], [ %93, %50 ]
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %4, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !11
  %59 = fmul contract double %58, %10
  %60 = load double, double addrspace(1)* %44, align 8, !tbaa !11
  %61 = fdiv contract double %59, %60
  %62 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7
  %63 = sitofp i32 %62 to double
  %64 = fmul contract double %61, %63
  %65 = fptosi double %64 to i32
  %66 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !7
  %67 = sitofp i32 %66 to double
  %68 = fmul contract double %61, %67
  %69 = fptosi double %68 to i32
  %70 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7
  %71 = sitofp i32 %70 to double
  %72 = fmul contract double %61, %71
  %73 = fptosi double %72 to i32
  %74 = sitofp i32 %51 to double
  %75 = fmul contract double %61, %74
  %76 = fptosi double %75 to i32
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %78 = atomicrmw add i32 addrspace(1)* %77, i32 %65 syncscope("agent-one-as") monotonic, align 4
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %56
  %80 = atomicrmw add i32 addrspace(1)* %79, i32 %69 syncscope("agent-one-as") monotonic, align 4
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %56
  %82 = atomicrmw add i32 addrspace(1)* %81, i32 %73 syncscope("agent-one-as") monotonic, align 4
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %56
  %84 = atomicrmw add i32 addrspace(1)* %83, i32 %76 syncscope("agent-one-as") monotonic, align 4
  %85 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7
  %86 = sub nsw i32 %85, %65
  store i32 %86, i32 addrspace(1)* %45, align 4, !tbaa !7
  %87 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !7
  %88 = sub nsw i32 %87, %69
  store i32 %88, i32 addrspace(1)* %46, align 4, !tbaa !7
  %89 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7
  %90 = sub nsw i32 %89, %73
  store i32 %90, i32 addrspace(1)* %47, align 4, !tbaa !7
  %91 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7
  %92 = sub nsw i32 %91, %76
  store i32 %92, i32 addrspace(1)* %48, align 4, !tbaa !7
  %93 = add nsw i32 %52, 1
  %94 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7
  %95 = icmp slt i32 %93, %94
  br i1 %95, label %50, label %96, !llvm.loop !13

96:                                               ; preds = %50, %34, %11
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

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!12 = !{!"double", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
