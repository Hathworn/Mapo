; ModuleID = '../data/hip_kernels/8588/13/main.cu'
source_filename = "../data/hip_kernels/8588/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ34sobelEdgeDetectionSharedMemOverlapPiS_iiiE5shMem = internal unnamed_addr addrspace(3) global [1024 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z34sobelEdgeDetectionSharedMemOverlapPiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul i32 %6, 30
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add i32 %7, %8
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = mul i32 %10, 30
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = add i32 %11, %12
  %14 = mul nsw i32 %13, %2
  %15 = add nsw i32 %9, %14
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !5, !amdgpu.noclobber !9
  %19 = shl nuw nsw i32 %12, 5
  %20 = add nuw nsw i32 %19, %8
  %21 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ34sobelEdgeDetectionSharedMemOverlapPiS_iiiE5shMem, i32 0, i32 %20
  store i32 %18, i32 addrspace(3)* %21, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %22 = icmp ne i32 %12, 0
  %23 = add nsw i32 %8, -1
  %24 = icmp ult i32 %23, 30
  %25 = select i1 %24, i1 %22, i1 false
  %26 = icmp ult i32 %12, 31
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %74

28:                                               ; preds = %5
  %29 = add nuw nsw i32 %8, 1
  %30 = add nsw i32 %19, -32
  %31 = add nsw i32 %30, %29
  %32 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ34sobelEdgeDetectionSharedMemOverlapPiS_iiiE5shMem, i32 0, i32 %31
  %33 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !5
  %34 = add nsw i32 %30, %23
  %35 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ34sobelEdgeDetectionSharedMemOverlapPiS_iiiE5shMem, i32 0, i32 %34
  %36 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !5
  %37 = add nuw nsw i32 %29, %19
  %38 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ34sobelEdgeDetectionSharedMemOverlapPiS_iiiE5shMem, i32 0, i32 %37
  %39 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !5
  %40 = add nuw nsw i32 %23, %19
  %41 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ34sobelEdgeDetectionSharedMemOverlapPiS_iiiE5shMem, i32 0, i32 %40
  %42 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %43 = add nuw nsw i32 %19, 32
  %44 = add nuw nsw i32 %43, %29
  %45 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ34sobelEdgeDetectionSharedMemOverlapPiS_iiiE5shMem, i32 0, i32 %44
  %46 = load i32, i32 addrspace(3)* %45, align 4, !tbaa !5
  %47 = add nuw nsw i32 %43, %23
  %48 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ34sobelEdgeDetectionSharedMemOverlapPiS_iiiE5shMem, i32 0, i32 %47
  %49 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !5
  %50 = sub i32 %39, %42
  %51 = shl i32 %50, 1
  %52 = add i32 %33, %46
  %53 = add i32 %36, %49
  %54 = sub i32 %52, %53
  %55 = add i32 %54, %51
  %56 = add nsw i32 %30, %8
  %57 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ34sobelEdgeDetectionSharedMemOverlapPiS_iiiE5shMem, i32 0, i32 %56
  %58 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !5
  %59 = add nuw nsw i32 %43, %8
  %60 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ34sobelEdgeDetectionSharedMemOverlapPiS_iiiE5shMem, i32 0, i32 %59
  %61 = load i32, i32 addrspace(3)* %60, align 4, !tbaa !5
  %62 = sub i32 %58, %61
  %63 = shl i32 %62, 1
  %64 = add i32 %36, %33
  %65 = add i32 %46, %49
  %66 = sub i32 %64, %65
  %67 = add i32 %66, %63
  %68 = mul nsw i32 %55, %55
  %69 = mul nsw i32 %67, %67
  %70 = add nuw nsw i32 %69, %68
  %71 = icmp sgt i32 %70, %4
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %16
  %73 = select i1 %71, i32 255, i32 0
  store i32 %73, i32 addrspace(1)* %72, align 4, !tbaa !5
  br label %74

74:                                               ; preds = %28, %5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
