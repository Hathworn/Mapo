; ModuleID = '../data/hip_kernels/17041/10/main.cu'
source_filename = "../data/hip_kernels/17041/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z20next_move_hub_kernelPiiS_S_S_S_PdS0_S_S_iid(i32 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture %4, i32 addrspace(1)* nocapture %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture readonly %9, i32 %10, i32 %11, double %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %1
  br i1 %23, label %24, label %91

24:                                               ; preds = %13
  %25 = sext i32 %22 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %28
  %30 = add nsw i32 %27, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %31
  %33 = bitcast i32 addrspace(1)* %29 to <2 x i32> addrspace(1)*
  %34 = load <2 x i32>, <2 x i32> addrspace(1)* %33, align 4, !tbaa !7
  %35 = extractelement <2 x i32> %34, i64 0
  %36 = extractelement <2 x i32> %34, i64 1
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %91

38:                                               ; preds = %24
  %39 = getelementptr inbounds double, double addrspace(1)* %7, i64 %28
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %28
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %28
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %28
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %28
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7
  br label %45

45:                                               ; preds = %38, %45
  %46 = phi i32 [ %44, %38 ], [ %87, %45 ]
  %47 = phi i32 [ %35, %38 ], [ %88, %45 ]
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %6, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !11
  %54 = fmul contract double %53, %12
  %55 = load double, double addrspace(1)* %39, align 8, !tbaa !11
  %56 = fdiv contract double %54, %55
  %57 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7
  %58 = sitofp i32 %57 to double
  %59 = fmul contract double %56, %58
  %60 = fptosi double %59 to i32
  %61 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7
  %62 = sitofp i32 %61 to double
  %63 = fmul contract double %56, %62
  %64 = fptosi double %63 to i32
  %65 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7
  %66 = sitofp i32 %65 to double
  %67 = fmul contract double %56, %66
  %68 = fptosi double %67 to i32
  %69 = sitofp i32 %46 to double
  %70 = fmul contract double %56, %69
  %71 = fptosi double %70 to i32
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %51
  %73 = atomicrmw add i32 addrspace(1)* %72, i32 %60 syncscope("agent-one-as") monotonic, align 4
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %51
  %75 = atomicrmw add i32 addrspace(1)* %74, i32 %64 syncscope("agent-one-as") monotonic, align 4
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %51
  %77 = atomicrmw add i32 addrspace(1)* %76, i32 %68 syncscope("agent-one-as") monotonic, align 4
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %51
  %79 = atomicrmw add i32 addrspace(1)* %78, i32 %71 syncscope("agent-one-as") monotonic, align 4
  %80 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7
  %81 = sub nsw i32 %80, %60
  store i32 %81, i32 addrspace(1)* %40, align 4, !tbaa !7
  %82 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7
  %83 = sub nsw i32 %82, %64
  store i32 %83, i32 addrspace(1)* %41, align 4, !tbaa !7
  %84 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7
  %85 = sub nsw i32 %84, %68
  store i32 %85, i32 addrspace(1)* %42, align 4, !tbaa !7
  %86 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7
  %87 = sub nsw i32 %86, %71
  store i32 %87, i32 addrspace(1)* %43, align 4, !tbaa !7
  %88 = add nsw i32 %47, 1
  %89 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %90 = icmp slt i32 %88, %89
  br i1 %90, label %45, label %91, !llvm.loop !13

91:                                               ; preds = %45, %24, %13
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
