; ModuleID = '../data/hip_kernels/820/31/main.cu'
source_filename = "../data/hip_kernels/820/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11calculationPcS_PiiiE11sharedDataA = internal unnamed_addr addrspace(3) global [34 x i8] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z11calculationPcS_Piii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  switch i32 %13, label %30 [
    i32 0, label %15
    i32 31, label %22
  ]

15:                                               ; preds = %5
  %16 = icmp sgt i32 %14, 0
  %17 = select i1 %16, i32 %14, i32 %4
  %18 = add nsw i32 %17, -1
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %19
  %21 = load i8, i8 addrspace(1)* %20, align 1, !tbaa !7, !amdgpu.noclobber !5
  store i8 %21, i8 addrspace(3)* getelementptr inbounds ([34 x i8], [34 x i8] addrspace(3)* @_ZZ11calculationPcS_PiiiE11sharedDataA, i32 0, i32 0), align 16, !tbaa !7
  br label %37

22:                                               ; preds = %5
  %23 = add nsw i32 %4, -1
  %24 = icmp slt i32 %14, %23
  %25 = add nsw i32 %14, 1
  %26 = select i1 %24, i32 %25, i32 0
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %27
  %29 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !7, !amdgpu.noclobber !5
  store i8 %29, i8 addrspace(3)* getelementptr inbounds ([34 x i8], [34 x i8] addrspace(3)* @_ZZ11calculationPcS_PiiiE11sharedDataA, i32 0, i32 33), align 1, !tbaa !7
  br label %37

30:                                               ; preds = %5
  %31 = add nsw i32 %4, -1
  %32 = icmp eq i32 %14, %31
  br i1 %32, label %33, label %37

33:                                               ; preds = %30
  %34 = load i8, i8 addrspace(1)* %0, align 1, !tbaa !7, !amdgpu.noclobber !5
  %35 = add nuw nsw i32 %13, 2
  %36 = getelementptr inbounds [34 x i8], [34 x i8] addrspace(3)* @_ZZ11calculationPcS_PiiiE11sharedDataA, i32 0, i32 %35
  store i8 %34, i8 addrspace(3)* %36, align 1, !tbaa !7
  br label %37

37:                                               ; preds = %22, %33, %30, %15
  %38 = icmp slt i32 %14, %4
  br i1 %38, label %39, label %48

39:                                               ; preds = %37
  %40 = sext i32 %14 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !7, !amdgpu.noclobber !5
  %43 = add nuw nsw i32 %13, 1
  %44 = getelementptr inbounds [34 x i8], [34 x i8] addrspace(3)* @_ZZ11calculationPcS_PiiiE11sharedDataA, i32 0, i32 %43
  store i8 %42, i8 addrspace(3)* %44, align 1, !tbaa !7
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %40
  %46 = load i8, i8 addrspace(1)* %45, align 1, !tbaa !7, !amdgpu.noclobber !5
  %47 = sext i8 %46 to i32
  br label %48

48:                                               ; preds = %39, %37
  %49 = phi i32 [ %47, %39 ], [ 0, %37 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %50, label %68

50:                                               ; preds = %48
  %51 = getelementptr inbounds [34 x i8], [34 x i8] addrspace(3)* @_ZZ11calculationPcS_PiiiE11sharedDataA, i32 0, i32 %13
  %52 = load i8, i8 addrspace(3)* %51, align 1, !tbaa !7
  %53 = sext i8 %52 to i32
  %54 = add nuw nsw i32 %13, 2
  %55 = getelementptr inbounds [34 x i8], [34 x i8] addrspace(3)* @_ZZ11calculationPcS_PiiiE11sharedDataA, i32 0, i32 %54
  %56 = load i8, i8 addrspace(3)* %55, align 1, !tbaa !7
  %57 = sext i8 %56 to i32
  %58 = sub nsw i32 %53, %57
  %59 = mul nsw i32 %58, %49
  %60 = add nuw nsw i32 %13, 1
  %61 = getelementptr inbounds [34 x i8], [34 x i8] addrspace(3)* @_ZZ11calculationPcS_PiiiE11sharedDataA, i32 0, i32 %60
  %62 = load i8, i8 addrspace(3)* %61, align 1, !tbaa !7
  %63 = sext i8 %62 to i32
  %64 = mul nsw i32 %63, %3
  %65 = add nsw i32 %59, %64
  %66 = sext i32 %14 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %66
  store i32 %65, i32 addrspace(1)* %67, align 4, !tbaa !10
  br label %68

68:                                               ; preds = %50, %48
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
