; ModuleID = '../data/hip_kernels/475/0/main.cu'
source_filename = "../data/hip_kernels/475/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10calcul_minPmiiPyPii(i64 addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i64 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture writeonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = sub nsw i32 %2, %1
  %9 = add nsw i32 %8, -1
  %10 = sitofp i32 %9 to float
  %11 = sitofp i32 %5 to float
  %12 = fdiv contract float %10, %11
  %13 = tail call float @llvm.ceil.f32(float %12)
  %14 = fptosi float %13 to i32
  %15 = sitofp i32 %14 to float
  %16 = fdiv contract float %10, %15
  %17 = tail call float @llvm.ceil.f32(float %16)
  %18 = fptosi float %17 to i32
  %19 = mul nsw i32 %7, %18
  %20 = add i32 %1, 1
  %21 = add i32 %20, %19
  %22 = add nsw i32 %14, -1
  %23 = icmp eq i32 %7, %22
  %24 = mul nsw i32 %22, %18
  %25 = sub nsw i32 %9, %24
  %26 = select i1 %23, i32 %25, i32 %18
  %27 = sext i32 %21 to i64
  %28 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %27
  %29 = load i64, i64 addrspace(1)* %28, align 8, !tbaa !5, !amdgpu.noclobber !9
  %30 = add nsw i32 %26, %21
  %31 = icmp sgt i32 %26, 0
  br i1 %31, label %32, label %44

32:                                               ; preds = %6, %32
  %33 = phi i32 [ %42, %32 ], [ %21, %6 ]
  %34 = phi i32 [ %41, %32 ], [ %21, %6 ]
  %35 = phi i64 [ %40, %32 ], [ %29, %6 ]
  %36 = sext i32 %33 to i64
  %37 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %36
  %38 = load i64, i64 addrspace(1)* %37, align 8, !tbaa !5, !amdgpu.noclobber !9
  %39 = icmp ult i64 %38, %35
  %40 = tail call i64 @llvm.umin.i64(i64 %38, i64 %35)
  %41 = select i1 %39, i32 %33, i32 %34
  %42 = add nsw i32 %33, 1
  %43 = icmp slt i32 %42, %30
  br i1 %43, label %32, label %44, !llvm.loop !10

44:                                               ; preds = %32, %6
  %45 = phi i64 [ %29, %6 ], [ %40, %32 ]
  %46 = phi i32 [ %21, %6 ], [ %41, %32 ]
  %47 = atomicrmw umin i64 addrspace(1)* %3, i64 %45 syncscope("agent-one-as") monotonic, align 8
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = load i64, i64 addrspace(1)* %3, align 8, !tbaa !12
  %49 = icmp eq i64 %48, %45
  br i1 %49, label %50, label %51

50:                                               ; preds = %44
  store i32 %46, i32 addrspace(1)* %4, align 4, !tbaa !14
  br label %51

51:                                               ; preds = %50, %44
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!13, !13, i64 0}
!13 = !{!"long long", !7, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !7, i64 0}
