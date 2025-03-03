; ModuleID = '../data/hip_kernels/3545/2/main.cu'
source_filename = "../data/hip_kernels/3545/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18CalculateBestIndexPdPiiE10distance_s = internal unnamed_addr addrspace(3) global [512 x double] undef, align 16
@_ZZ18CalculateBestIndexPdPiiE18bin_smallest_index = internal unnamed_addr addrspace(3) global [512 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18CalculateBestIndexPdPii(double addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = shl nuw nsw i32 %9, 1
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %4
  %14 = icmp ult i32 %13, %2
  br i1 %14, label %15, label %21

15:                                               ; preds = %3
  %16 = zext i32 %13 to i64
  %17 = getelementptr inbounds double, double addrspace(1)* %0, i64 %16
  %18 = load double, double addrspace(1)* %17, align 8, !tbaa !7, !amdgpu.noclobber !6
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %16
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !11, !amdgpu.noclobber !6
  br label %21

21:                                               ; preds = %3, %15
  %22 = phi double [ %18, %15 ], [ 6.553500e+04, %3 ]
  %23 = phi i32 [ %20, %15 ], [ 0, %3 ]
  %24 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ18CalculateBestIndexPdPiiE10distance_s, i32 0, i32 %4
  store double %22, double addrspace(3)* %24, align 8
  %25 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ18CalculateBestIndexPdPiiE18bin_smallest_index, i32 0, i32 %4
  store i32 %23, i32 addrspace(3)* %25, align 4
  %26 = add nuw nsw i32 %4, %9
  %27 = add i32 %26, %12
  %28 = icmp ult i32 %27, %2
  br i1 %28, label %29, label %36

29:                                               ; preds = %21
  %30 = zext i32 %27 to i64
  %31 = getelementptr inbounds double, double addrspace(1)* %0, i64 %30
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !7, !amdgpu.noclobber !6
  %33 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ18CalculateBestIndexPdPiiE10distance_s, i32 0, i32 %26
  store double %32, double addrspace(3)* %33, align 8, !tbaa !7
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %30
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !11, !amdgpu.noclobber !6
  br label %38

36:                                               ; preds = %21
  %37 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ18CalculateBestIndexPdPiiE10distance_s, i32 0, i32 %26
  store double 6.553500e+04, double addrspace(3)* %37, align 8, !tbaa !7
  br label %38

38:                                               ; preds = %36, %29
  %39 = phi i32 [ 0, %36 ], [ %35, %29 ]
  %40 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ18CalculateBestIndexPdPiiE18bin_smallest_index, i32 0, i32 %26
  store i32 %39, i32 addrspace(3)* %40, align 4, !tbaa !11
  br label %43

41:                                               ; preds = %55
  %42 = icmp eq i32 %4, 0
  br i1 %42, label %58, label %64

43:                                               ; preds = %38, %55
  %44 = phi i32 [ %9, %38 ], [ %56, %55 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = icmp ult i32 %4, %44
  br i1 %45, label %46, label %55

46:                                               ; preds = %43
  %47 = load double, double addrspace(3)* %24, align 8, !tbaa !7
  %48 = add nuw nsw i32 %44, %4
  %49 = getelementptr inbounds [512 x double], [512 x double] addrspace(3)* @_ZZ18CalculateBestIndexPdPiiE10distance_s, i32 0, i32 %48
  %50 = load double, double addrspace(3)* %49, align 8, !tbaa !7
  %51 = fcmp contract ogt double %47, %50
  br i1 %51, label %52, label %55

52:                                               ; preds = %46
  %53 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ18CalculateBestIndexPdPiiE18bin_smallest_index, i32 0, i32 %48
  %54 = load i32, i32 addrspace(3)* %53, align 4, !tbaa !11
  store i32 %54, i32 addrspace(3)* %25, align 4, !tbaa !11
  store double %50, double addrspace(3)* %24, align 8, !tbaa !7
  br label %55

55:                                               ; preds = %43, %52, %46
  %56 = lshr i32 %44, 1
  %57 = icmp ult i32 %44, 2
  br i1 %57, label %41, label %43, !llvm.loop !13

58:                                               ; preds = %41
  %59 = load double, double addrspace(3)* getelementptr inbounds ([512 x double], [512 x double] addrspace(3)* @_ZZ18CalculateBestIndexPdPiiE10distance_s, i32 0, i32 0), align 16, !tbaa !7
  %60 = zext i32 %10 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %0, i64 %60
  store double %59, double addrspace(1)* %61, align 8, !tbaa !7
  %62 = load i32, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ18CalculateBestIndexPdPiiE18bin_smallest_index, i32 0, i32 0), align 16, !tbaa !11
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %60
  store i32 %62, i32 addrspace(1)* %63, align 4, !tbaa !11
  br label %64

64:                                               ; preds = %58, %41
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
