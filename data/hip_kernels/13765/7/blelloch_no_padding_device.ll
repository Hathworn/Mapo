; ModuleID = '../data/hip_kernels/13765/7/main.cu'
source_filename = "../data/hip_kernels/13765/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@temp_array = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19blelloch_no_paddingPjm(i32 addrspace(1)* nocapture %0, i64 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %4
  %6 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !5, !amdgpu.noclobber !9
  %7 = uitofp i32 %6 to float
  %8 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp_array, i32 0, i32 %3
  store float %7, float addrspace(3)* %8, align 4, !tbaa !10
  %9 = lshr i64 %1, 1
  %10 = add nuw i64 %9, %4
  %11 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %10
  %12 = load i32, i32 addrspace(1)* %11, align 4, !tbaa !5, !amdgpu.noclobber !9
  %13 = uitofp i32 %12 to float
  %14 = trunc i64 %10 to i32
  %15 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp_array, i32 0, i32 %14
  store float %13, float addrspace(3)* %15, align 4, !tbaa !10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %16 = trunc i64 %9 to i32
  %17 = icmp sgt i32 %16, 0
  br i1 %17, label %18, label %22

18:                                               ; preds = %2
  %19 = shl nuw nsw i32 %3, 1
  %20 = add nuw nsw i32 %19, 1
  %21 = add nuw nsw i32 %19, 2
  br label %25

22:                                               ; preds = %39, %2
  %23 = phi i32 [ 1, %2 ], [ %40, %39 ]
  %24 = icmp eq i32 %3, 0
  br i1 %24, label %43, label %47

25:                                               ; preds = %18, %39
  %26 = phi i32 [ 1, %18 ], [ %40, %39 ]
  %27 = phi i32 [ %16, %18 ], [ %41, %39 ]
  %28 = icmp slt i32 %3, %27
  br i1 %28, label %29, label %39

29:                                               ; preds = %25
  %30 = mul nsw i32 %26, %20
  %31 = add nsw i32 %30, -1
  %32 = mul nsw i32 %26, %21
  %33 = add nsw i32 %32, -1
  %34 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp_array, i32 0, i32 %31
  %35 = load float, float addrspace(3)* %34, align 4, !tbaa !10
  %36 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp_array, i32 0, i32 %33
  %37 = load float, float addrspace(3)* %36, align 4, !tbaa !10
  %38 = fadd contract float %35, %37
  store float %38, float addrspace(3)* %36, align 4, !tbaa !10
  br label %39

39:                                               ; preds = %29, %25
  %40 = shl nsw i32 %26, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = lshr i32 %27, 1
  %42 = icmp ult i32 %27, 2
  br i1 %42, label %22, label %25, !llvm.loop !12

43:                                               ; preds = %22
  %44 = trunc i64 %1 to i32
  %45 = add i32 %44, -1
  %46 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp_array, i32 0, i32 %45
  store float 0.000000e+00, float addrspace(3)* %46, align 4, !tbaa !10
  br label %47

47:                                               ; preds = %43, %22
  %48 = icmp ugt i64 %1, 1
  br i1 %48, label %49, label %53

49:                                               ; preds = %47
  %50 = shl nuw nsw i32 %3, 1
  %51 = add nuw nsw i32 %50, 1
  %52 = add nuw nsw i32 %50, 2
  br label %58

53:                                               ; preds = %74, %47
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = load float, float addrspace(3)* %8, align 4, !tbaa !10
  %55 = fptoui float %54 to i32
  store i32 %55, i32 addrspace(1)* %5, align 4, !tbaa !5
  %56 = load float, float addrspace(3)* %15, align 4, !tbaa !10
  %57 = fptoui float %56 to i32
  store i32 %57, i32 addrspace(1)* %11, align 4, !tbaa !5
  ret void

58:                                               ; preds = %49, %74
  %59 = phi i32 [ %23, %49 ], [ %61, %74 ]
  %60 = phi i32 [ 1, %49 ], [ %75, %74 ]
  %61 = lshr i32 %59, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %62 = icmp slt i32 %3, %60
  br i1 %62, label %63, label %74

63:                                               ; preds = %58
  %64 = mul nsw i32 %61, %51
  %65 = add nsw i32 %64, -1
  %66 = mul nsw i32 %61, %52
  %67 = add nsw i32 %66, -1
  %68 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp_array, i32 0, i32 %65
  %69 = load float, float addrspace(3)* %68, align 4, !tbaa !10
  %70 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @temp_array, i32 0, i32 %67
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !10
  store float %71, float addrspace(3)* %68, align 4, !tbaa !10
  %72 = load float, float addrspace(3)* %70, align 4, !tbaa !10
  %73 = fadd contract float %69, %72
  store float %73, float addrspace(3)* %70, align 4, !tbaa !10
  br label %74

74:                                               ; preds = %58, %63
  %75 = shl nsw i32 %60, 1
  %76 = zext i32 %75 to i64
  %77 = icmp ult i64 %76, %1
  br i1 %77, label %58, label %53, !llvm.loop !14
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
