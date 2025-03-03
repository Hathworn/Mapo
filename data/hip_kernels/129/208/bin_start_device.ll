; ModuleID = '../data/hip_kernels/129/208/main.cu'
source_filename = "../data/hip_kernels/129/208/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sharedBin = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z9bin_startPiS_S_i(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %29

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !6
  %19 = add nuw nsw i32 %5, 1
  %20 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedBin, i32 0, i32 %19
  store i32 %18, i32 addrspace(3)* %20, align 4, !tbaa !7
  %21 = icmp sgt i32 %13, 0
  %22 = icmp eq i32 %5, 0
  %23 = and i1 %22, %21
  br i1 %23, label %24, label %29

24:                                               ; preds = %15
  %25 = add nsw i32 %13, -1
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !6
  store i32 %28, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sharedBin, i32 0, i32 0), align 4, !tbaa !7
  br label %29

29:                                               ; preds = %15, %24, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %14, label %30, label %55

30:                                               ; preds = %29
  %31 = sext i32 %13 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %34 = icmp eq i32 %13, 0
  br i1 %34, label %39, label %35

35:                                               ; preds = %30
  %36 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedBin, i32 0, i32 %5
  %37 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !7
  %38 = icmp eq i32 %33, %37
  br i1 %38, label %48, label %39

39:                                               ; preds = %35, %30
  %40 = sext i32 %33 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %40
  store i32 %13, i32 addrspace(1)* %41, align 4, !tbaa !7
  %42 = icmp sgt i32 %13, 0
  br i1 %42, label %43, label %48

43:                                               ; preds = %39
  %44 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedBin, i32 0, i32 %5
  %45 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !7
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %46
  store i32 %13, i32 addrspace(1)* %47, align 4, !tbaa !7
  br label %48

48:                                               ; preds = %39, %43, %35
  %49 = add nsw i32 %3, -1
  %50 = icmp eq i32 %13, %49
  br i1 %50, label %51, label %55

51:                                               ; preds = %48
  %52 = add nsw i32 %13, 1
  %53 = sext i32 %33 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %53
  store i32 %52, i32 addrspace(1)* %54, align 4, !tbaa !7
  br label %55

55:                                               ; preds = %48, %51, %29
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

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
