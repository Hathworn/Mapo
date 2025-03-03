; ModuleID = '../data/hip_kernels/4694/81/main.cu'
source_filename = "../data/hip_kernels/4694/81/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ28transpose_smem_pad_unrollingPiS_iiE4tile = internal unnamed_addr addrspace(3) global [2080 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z28transpose_smem_pad_unrollingPiS_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = shl nuw nsw i32 %10, 1
  %12 = mul i32 %11, %6
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = mul nsw i32 %22, %2
  %24 = add nsw i32 %23, %14
  %25 = mul nuw nsw i32 %21, %10
  %26 = add nuw nsw i32 %25, %13
  %27 = freeze i32 %26
  %28 = freeze i32 %19
  %29 = udiv i32 %27, %28
  %30 = mul i32 %29, %28
  %31 = sub i32 %27, %30
  %32 = add i32 %20, %31
  %33 = shl i32 %6, 1
  %34 = mul i32 %33, %10
  %35 = add i32 %34, %29
  %36 = mul nsw i32 %35, %3
  %37 = add nsw i32 %32, %36
  %38 = icmp slt i32 %14, %2
  %39 = icmp slt i32 %22, %3
  %40 = select i1 %38, i1 %39, i1 false
  br i1 %40, label %41, label %68

41:                                               ; preds = %4
  %42 = add nuw nsw i32 %11, 1
  %43 = mul nuw nsw i32 %42, %21
  %44 = add nuw nsw i32 %43, %13
  %45 = sext i32 %24 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = getelementptr inbounds [2080 x i32], [2080 x i32] addrspace(3)* @_ZZ28transpose_smem_pad_unrollingPiS_iiE4tile, i32 0, i32 %44
  store i32 %47, i32 addrspace(3)* %48, align 4, !tbaa !7
  %49 = add nsw i32 %24, 32
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = add nuw nsw i32 %44, 32
  %54 = getelementptr inbounds [2080 x i32], [2080 x i32] addrspace(3)* @_ZZ28transpose_smem_pad_unrollingPiS_iiE4tile, i32 0, i32 %53
  store i32 %52, i32 addrspace(3)* %54, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %55 = mul nuw nsw i32 %31, %42
  %56 = add nuw nsw i32 %55, %29
  %57 = getelementptr inbounds [2080 x i32], [2080 x i32] addrspace(3)* @_ZZ28transpose_smem_pad_unrollingPiS_iiE4tile, i32 0, i32 %56
  %58 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !7
  %59 = sext i32 %37 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %59
  store i32 %58, i32 addrspace(1)* %60, align 4, !tbaa !7
  %61 = add nuw nsw i32 %56, 32
  %62 = getelementptr inbounds [2080 x i32], [2080 x i32] addrspace(3)* @_ZZ28transpose_smem_pad_unrollingPiS_iiE4tile, i32 0, i32 %61
  %63 = load i32, i32 addrspace(3)* %62, align 4, !tbaa !7
  %64 = shl nsw i32 %3, 5
  %65 = add nsw i32 %37, %64
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %66
  store i32 %63, i32 addrspace(1)* %67, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %41, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
