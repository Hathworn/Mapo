; ModuleID = '../data/hip_kernels/11819/347/main.cu'
source_filename = "../data/hip_kernels/11819/347/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z29gpu_stencil37_hack1_cp_slicesPdS_S_S_mmmiii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readnone %1, double addrspace(1)* nocapture readnone %2, double addrspace(1)* nocapture writeonly %3, i64 %4, i64 %5, i64 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %12 = mul i32 %11, %9
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = mul i32 %13, %8
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = mul i32 %20, %19
  %22 = mul i64 %5, %4
  %23 = sext i32 %14 to i64
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add nsw i32 %21, %24
  %26 = sext i32 %25 to i64
  %27 = icmp uge i64 %26, %5
  %28 = icmp sgt i32 %8, 0
  br i1 %28, label %29, label %44

29:                                               ; preds = %10
  %30 = sext i32 %21 to i64
  %31 = add nsw i32 %12, 1
  %32 = sext i32 %31 to i64
  %33 = icmp uge i64 %32, %6
  %34 = sext i32 %12 to i64
  %35 = mul i64 %22, %34
  %36 = zext i32 %11 to i64
  %37 = shl nuw nsw i64 %36, 1
  %38 = mul i64 %37, %22
  %39 = zext i32 %24 to i64
  %40 = add nsw i64 %30, %39
  %41 = add i64 %40, %38
  %42 = add i64 %40, %35
  %43 = select i1 %33, i1 true, i1 %27
  br label %45

44:                                               ; preds = %69, %10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

45:                                               ; preds = %29, %69
  %46 = phi i32 [ 0, %29 ], [ %70, %69 ]
  %47 = add nsw i32 %46, %14
  %48 = sext i32 %47 to i64
  %49 = icmp uge i64 %48, %4
  %50 = mul i64 %48, %5
  %51 = add i64 %41, %50
  %52 = zext i32 %46 to i64
  %53 = add nsw i64 %52, %23
  %54 = mul i64 %53, %5
  %55 = add i64 %42, %54
  %56 = select i1 %27, i1 true, i1 %49
  br i1 %56, label %61, label %57

57:                                               ; preds = %45
  %58 = getelementptr inbounds double, double addrspace(1)* %0, i64 %55
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7
  %60 = getelementptr inbounds double, double addrspace(1)* %3, i64 %51
  store double %59, double addrspace(1)* %60, align 8, !tbaa !7
  br label %61

61:                                               ; preds = %45, %57
  %62 = select i1 %43, i1 true, i1 %49
  br i1 %62, label %69, label %63

63:                                               ; preds = %61
  %64 = add i64 %55, %22
  %65 = getelementptr inbounds double, double addrspace(1)* %0, i64 %64
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !7
  %67 = add i64 %51, %22
  %68 = getelementptr inbounds double, double addrspace(1)* %3, i64 %67
  store double %66, double addrspace(1)* %68, align 8, !tbaa !7
  br label %69

69:                                               ; preds = %61, %63
  %70 = add nuw nsw i32 %46, 1
  %71 = icmp eq i32 %70, %8
  br i1 %71, label %44, label %45, !llvm.loop !11
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
