; ModuleID = '../data/hip_kernels/12708/3/main.cu'
source_filename = "../data/hip_kernels/12708/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7oneMovePiiiiiE5tmp_T = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16
@_ZZ7oneMovePiiiiiE5begin = internal unnamed_addr addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7oneMovePiiiii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp eq i32 %6, 0
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  br i1 %7, label %9, label %20

9:                                                ; preds = %5
  %10 = freeze i32 %8
  %11 = freeze i32 %3
  %12 = udiv i32 %10, %11
  %13 = shl i32 %1, 1
  %14 = mul i32 %13, %12
  %15 = mul i32 %12, %11
  %16 = sub i32 %10, %15
  %17 = shl i32 %2, 9
  %18 = mul i32 %17, %16
  %19 = add i32 %18, %14
  store i32 %19, i32 addrspace(3)* @_ZZ7oneMovePiiiiiE5begin, align 4, !tbaa !5
  br label %20

20:                                               ; preds = %5, %9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = udiv i32 %8, %4
  %22 = and i32 %21, 1
  %23 = icmp eq i32 %22, 0
  %24 = shl nsw i32 %2, 9
  %25 = icmp sgt i32 %2, 0
  br i1 %23, label %26, label %57

26:                                               ; preds = %20
  br i1 %25, label %27, label %88

27:                                               ; preds = %26
  %28 = load i32, i32 addrspace(3)* @_ZZ7oneMovePiiiiiE5begin, align 4, !tbaa !5
  %29 = icmp ult i32 %6, 512
  %30 = add nsw i32 %6, -512
  %31 = add i32 %30, %1
  %32 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ7oneMovePiiiiiE5tmp_T, i32 0, i32 %6
  %33 = add nuw nsw i32 %6, 512
  %34 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ7oneMovePiiiiiE5tmp_T, i32 0, i32 %33
  %35 = select i1 %29, i32 %6, i32 %31
  br label %36

36:                                               ; preds = %27, %47
  %37 = phi i32 [ %28, %27 ], [ %53, %47 ]
  %38 = add i32 %37, %35
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !5
  store i32 %41, i32 addrspace(3)* %32, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %29, label %42, label %47

42:                                               ; preds = %36
  %43 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !5
  %44 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !5
  %45 = icmp sgt i32 %43, %44
  br i1 %45, label %46, label %47

46:                                               ; preds = %42
  store i32 %43, i32 addrspace(3)* %34, align 4, !tbaa !5
  store i32 %44, i32 addrspace(3)* %32, align 4, !tbaa !5
  br label %47

47:                                               ; preds = %46, %42, %36
  %48 = phi i32 [ %6, %46 ], [ %6, %42 ], [ %31, %36 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !5
  %50 = add i32 %37, %48
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %51
  store i32 %49, i32 addrspace(1)* %52, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %53 = add nsw i32 %37, 512
  %54 = load i32, i32 addrspace(3)* @_ZZ7oneMovePiiiiiE5begin, align 4, !tbaa !5
  %55 = add nsw i32 %54, %24
  %56 = icmp slt i32 %53, %55
  br i1 %56, label %36, label %88, !llvm.loop !9

57:                                               ; preds = %20
  br i1 %25, label %58, label %88

58:                                               ; preds = %57
  %59 = load i32, i32 addrspace(3)* @_ZZ7oneMovePiiiiiE5begin, align 4, !tbaa !5
  %60 = icmp ult i32 %6, 512
  %61 = add nsw i32 %6, -512
  %62 = add i32 %61, %1
  %63 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ7oneMovePiiiiiE5tmp_T, i32 0, i32 %6
  %64 = add nuw nsw i32 %6, 512
  %65 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ7oneMovePiiiiiE5tmp_T, i32 0, i32 %64
  %66 = select i1 %60, i32 %6, i32 %62
  br label %67

67:                                               ; preds = %58, %78
  %68 = phi i32 [ %59, %58 ], [ %84, %78 ]
  %69 = add i32 %68, %66
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !5
  store i32 %72, i32 addrspace(3)* %63, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %60, label %73, label %78

73:                                               ; preds = %67
  %74 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !5
  %75 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !5
  %76 = icmp slt i32 %74, %75
  br i1 %76, label %77, label %78

77:                                               ; preds = %73
  store i32 %74, i32 addrspace(3)* %65, align 4, !tbaa !5
  store i32 %75, i32 addrspace(3)* %63, align 4, !tbaa !5
  br label %78

78:                                               ; preds = %77, %73, %67
  %79 = phi i32 [ %6, %77 ], [ %6, %73 ], [ %62, %67 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %80 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !5
  %81 = add i32 %68, %79
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %82
  store i32 %80, i32 addrspace(1)* %83, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %84 = add nsw i32 %68, 512
  %85 = load i32, i32 addrspace(3)* @_ZZ7oneMovePiiiiiE5begin, align 4, !tbaa !5
  %86 = add nsw i32 %85, %24
  %87 = icmp slt i32 %84, %86
  br i1 %87, label %67, label %88, !llvm.loop !11

88:                                               ; preds = %78, %47, %57, %26
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
