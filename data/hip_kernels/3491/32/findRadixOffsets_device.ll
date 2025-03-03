; ModuleID = '../data/hip_kernels/3491/32/main.cu'
source_filename = "../data/hip_kernels/3491/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x i32> }

@_ZZ16findRadixOffsetsP15HIP_vector_typeIjLj2EEPjS2_jjjE14sStartPointers = internal unnamed_addr addrspace(3) global [16 x i32] undef, align 16
@sRadix1 = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z16findRadixOffsetsP15HIP_vector_typeIjLj2EEPjS2_jjj(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %7, %13
  %15 = add i32 %14, %8
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %16, i32 0, i32 0, i32 0, i64 0
  %18 = load i32, i32 addrspace(1)* %17, align 8, !amdgpu.noclobber !6
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %16, i32 0, i32 0, i32 0, i64 1
  %20 = load i32, i32 addrspace(1)* %19, align 4, !amdgpu.noclobber !6
  %21 = lshr i32 %18, %3
  %22 = and i32 %21, 15
  %23 = shl nuw nsw i32 %8, 1
  %24 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sRadix1, i32 0, i32 %23
  store i32 %22, i32 addrspace(3)* %24, align 4, !tbaa !7
  %25 = lshr i32 %20, %3
  %26 = and i32 %25, 15
  %27 = add nuw nsw i32 %23, 1
  %28 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sRadix1, i32 0, i32 %27
  store i32 %26, i32 addrspace(3)* %28, align 4, !tbaa !7
  %29 = icmp ult i32 %8, 16
  br i1 %29, label %30, label %32

30:                                               ; preds = %6
  %31 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ16findRadixOffsetsP15HIP_vector_typeIjLj2EEPjS2_jjjE14sStartPointers, i32 0, i32 %8
  store i32 0, i32 addrspace(3)* %31, align 4, !tbaa !7
  br label %32

32:                                               ; preds = %30, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = icmp eq i32 %8, 0
  br i1 %33, label %44, label %34

34:                                               ; preds = %32
  %35 = add nsw i32 %8, -1
  %36 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sRadix1, i32 0, i32 %35
  %37 = bitcast i32 addrspace(3)* %36 to <2 x i32> addrspace(3)*
  %38 = load <2 x i32>, <2 x i32> addrspace(3)* %37, align 4, !tbaa !7
  %39 = extractelement <2 x i32> %38, i64 0
  %40 = extractelement <2 x i32> %38, i64 1
  %41 = icmp eq i32 %40, %39
  br i1 %41, label %44, label %42

42:                                               ; preds = %34
  %43 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ16findRadixOffsetsP15HIP_vector_typeIjLj2EEPjS2_jjjE14sStartPointers, i32 0, i32 %40
  store i32 %8, i32 addrspace(3)* %43, align 4, !tbaa !7
  br label %44

44:                                               ; preds = %42, %34, %32
  %45 = add nuw nsw i32 %8, %13
  %46 = add nsw i32 %45, -1
  %47 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sRadix1, i32 0, i32 %46
  %48 = bitcast i32 addrspace(3)* %47 to <2 x i32> addrspace(3)*
  %49 = load <2 x i32>, <2 x i32> addrspace(3)* %48, align 4, !tbaa !7
  %50 = extractelement <2 x i32> %49, i64 0
  %51 = extractelement <2 x i32> %49, i64 1
  %52 = icmp eq i32 %51, %50
  br i1 %52, label %55, label %53

53:                                               ; preds = %44
  %54 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ16findRadixOffsetsP15HIP_vector_typeIjLj2EEPjS2_jjjE14sStartPointers, i32 0, i32 %51
  store i32 %45, i32 addrspace(3)* %54, align 4, !tbaa !7
  br label %55

55:                                               ; preds = %53, %44
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %29, label %56, label %63

56:                                               ; preds = %55
  %57 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ16findRadixOffsetsP15HIP_vector_typeIjLj2EEPjS2_jjjE14sStartPointers, i32 0, i32 %8
  %58 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !7
  %59 = shl i32 %7, 4
  %60 = add nuw i32 %59, %8
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %61
  store i32 %58, i32 addrspace(1)* %62, align 4, !tbaa !7
  br label %63

63:                                               ; preds = %56, %55
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %33, label %76, label %64

64:                                               ; preds = %63
  %65 = add nsw i32 %8, -1
  %66 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sRadix1, i32 0, i32 %65
  %67 = bitcast i32 addrspace(3)* %66 to <2 x i32> addrspace(3)*
  %68 = load <2 x i32>, <2 x i32> addrspace(3)* %67, align 4, !tbaa !7
  %69 = extractelement <2 x i32> %68, i64 0
  %70 = extractelement <2 x i32> %68, i64 1
  %71 = icmp eq i32 %70, %69
  br i1 %71, label %76, label %72

72:                                               ; preds = %64
  %73 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ16findRadixOffsetsP15HIP_vector_typeIjLj2EEPjS2_jjjE14sStartPointers, i32 0, i32 %69
  %74 = load i32, i32 addrspace(3)* %73, align 4, !tbaa !7
  %75 = sub i32 %8, %74
  store i32 %75, i32 addrspace(3)* %73, align 4, !tbaa !7
  br label %76

76:                                               ; preds = %72, %64, %63
  %77 = bitcast i32 addrspace(3)* %47 to <2 x i32> addrspace(3)*
  %78 = load <2 x i32>, <2 x i32> addrspace(3)* %77, align 4, !tbaa !7
  %79 = extractelement <2 x i32> %78, i64 0
  %80 = extractelement <2 x i32> %78, i64 1
  %81 = icmp eq i32 %80, %79
  br i1 %81, label %86, label %82

82:                                               ; preds = %76
  %83 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ16findRadixOffsetsP15HIP_vector_typeIjLj2EEPjS2_jjjE14sStartPointers, i32 0, i32 %79
  %84 = load i32, i32 addrspace(3)* %83, align 4, !tbaa !7
  %85 = sub i32 %45, %84
  store i32 %85, i32 addrspace(3)* %83, align 4, !tbaa !7
  br label %86

86:                                               ; preds = %82, %76
  %87 = add nsw i32 %13, -1
  %88 = icmp eq i32 %8, %87
  br i1 %88, label %89, label %97

89:                                               ; preds = %86
  %90 = shl nuw nsw i32 %13, 1
  %91 = add nsw i32 %90, -1
  %92 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sRadix1, i32 0, i32 %91
  %93 = load i32, i32 addrspace(3)* %92, align 4, !tbaa !7
  %94 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ16findRadixOffsetsP15HIP_vector_typeIjLj2EEPjS2_jjjE14sStartPointers, i32 0, i32 %93
  %95 = load i32, i32 addrspace(3)* %94, align 4, !tbaa !7
  %96 = sub i32 %90, %95
  store i32 %96, i32 addrspace(3)* %94, align 4, !tbaa !7
  br label %97

97:                                               ; preds = %89, %86
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %29, label %98, label %105

98:                                               ; preds = %97
  %99 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ16findRadixOffsetsP15HIP_vector_typeIjLj2EEPjS2_jjjE14sStartPointers, i32 0, i32 %8
  %100 = load i32, i32 addrspace(3)* %99, align 4, !tbaa !7
  %101 = mul i32 %8, %5
  %102 = add i32 %101, %7
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %103
  store i32 %100, i32 addrspace(1)* %104, align 4, !tbaa !7
  br label %105

105:                                              ; preds = %98, %97
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
