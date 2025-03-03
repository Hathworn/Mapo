; ModuleID = '../data/hip_kernels/3491/33/main.cu'
source_filename = "../data/hip_kernels/3491/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x i32> }

@_ZZ11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_jE6sKeys2 = internal unnamed_addr addrspace(3) global [256 x %struct.HIP_vector_type] undef, align 16
@_ZZ11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_jE8sValues2 = internal unnamed_addr addrspace(3) global [256 x %struct.HIP_vector_type] undef, align 16
@_ZZ11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_jE8sOffsets = internal unnamed_addr addrspace(3) global [16 x i32] undef, align 16
@_ZZ11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_jE13sBlockOffsets = internal unnamed_addr addrspace(3) global [16 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_j(i32 %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture writeonly %2, %struct.HIP_vector_type addrspace(1)* nocapture readonly %3, %struct.HIP_vector_type addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readnone %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %14
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %19
  %21 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_jE6sKeys2, i32 0, i32 %17
  %22 = bitcast %struct.HIP_vector_type addrspace(1)* %20 to i64 addrspace(1)*
  %23 = bitcast %struct.HIP_vector_type addrspace(3)* %21 to i64 addrspace(3)*
  %24 = load i64, i64 addrspace(1)* %22, align 8, !amdgpu.noclobber !5
  store i64 %24, i64 addrspace(3)* %23, align 8
  %25 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %19
  %26 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_jE8sValues2, i32 0, i32 %17
  %27 = bitcast %struct.HIP_vector_type addrspace(1)* %25 to i64 addrspace(1)*
  %28 = bitcast %struct.HIP_vector_type addrspace(3)* %26 to i64 addrspace(3)*
  %29 = load i64, i64 addrspace(1)* %27, align 8, !amdgpu.noclobber !5
  store i64 %29, i64 addrspace(3)* %28, align 8
  %30 = icmp ult i32 %17, 16
  br i1 %30, label %31, label %44

31:                                               ; preds = %9
  %32 = mul i32 %17, %8
  %33 = add i32 %32, %15
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_jE8sOffsets, i32 0, i32 %17
  store i32 %36, i32 addrspace(3)* %37, align 4, !tbaa !7
  %38 = shl i32 %15, 4
  %39 = add nuw i32 %38, %17
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_jE13sBlockOffsets, i32 0, i32 %17
  store i32 %42, i32 addrspace(3)* %43, align 4, !tbaa !7
  br label %44

44:                                               ; preds = %31, %9
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_jE6sKeys2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 %17
  %46 = load i32, i32 addrspace(3)* %45, align 4, !tbaa !7
  %47 = lshr i32 %46, %0
  %48 = and i32 %47, 15
  %49 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_jE8sOffsets, i32 0, i32 %48
  %50 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !7
  %51 = add i32 %50, %17
  %52 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_jE13sBlockOffsets, i32 0, i32 %48
  %53 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !7
  %54 = sub i32 %51, %53
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %55
  store i32 %46, i32 addrspace(1)* %56, align 4, !tbaa !7
  %57 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_jE8sValues2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 %17
  %58 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !7
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %55
  store i32 %58, i32 addrspace(1)* %59, align 4, !tbaa !7
  %60 = add nuw nsw i32 %17, %14
  %61 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_jE6sKeys2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 %60
  %62 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !7
  %63 = lshr i32 %62, %0
  %64 = and i32 %63, 15
  %65 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_jE8sOffsets, i32 0, i32 %64
  %66 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !7
  %67 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_jE13sBlockOffsets, i32 0, i32 %64
  %68 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !7
  %69 = add i32 %60, %66
  %70 = sub i32 %69, %68
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %71
  store i32 %62, i32 addrspace(1)* %72, align 4, !tbaa !7
  %73 = getelementptr inbounds [256 x %struct.HIP_vector_type], [256 x %struct.HIP_vector_type] addrspace(3)* @_ZZ11reorderDatajPjS_P15HIP_vector_typeIjLj2EES2_S_S_S_jE8sValues2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 %60
  %74 = load i32, i32 addrspace(3)* %73, align 4, !tbaa !7
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %71
  store i32 %74, i32 addrspace(1)* %75, align 4, !tbaa !7
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
