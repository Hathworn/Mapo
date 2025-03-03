; ModuleID = '../data/hip_kernels/13245/0/main.cu'
source_filename = "../data/hip_kernels/13245/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7operatePcS_iiE5local = internal unnamed_addr addrspace(3) global [34 x [34 x i8]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7operatePcS_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = mul nsw i32 %13, %2
  %23 = add nsw i32 %22, %21
  %24 = add nsw i32 %21, -1
  %25 = icmp ult i32 %20, 34
  br i1 %25, label %26, label %61

26:                                               ; preds = %4
  %27 = add nsw i32 %13, -1
  %28 = icmp ult i32 %12, 34
  br label %29

29:                                               ; preds = %26, %56
  %30 = phi i32 [ %20, %26 ], [ %59, %56 ]
  %31 = phi i32 [ %24, %26 ], [ %57, %56 ]
  br i1 %28, label %32, label %56

32:                                               ; preds = %29
  %33 = icmp sgt i32 %31, -1
  %34 = icmp slt i32 %31, %2
  br label %35

35:                                               ; preds = %32, %49
  %36 = phi i32 [ %12, %32 ], [ %54, %49 ]
  %37 = phi i32 [ %27, %32 ], [ %52, %49 ]
  %38 = icmp sgt i32 %37, -1
  br i1 %38, label %39, label %49

39:                                               ; preds = %35
  %40 = icmp slt i32 %37, %3
  %41 = select i1 %40, i1 %33, i1 false
  %42 = select i1 %41, i1 %34, i1 false
  br i1 %42, label %43, label %49

43:                                               ; preds = %39
  %44 = mul nsw i32 %37, %2
  %45 = add nsw i32 %44, %31
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %46
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !7, !amdgpu.noclobber !5
  br label %49

49:                                               ; preds = %35, %39, %43
  %50 = phi i8 [ %48, %43 ], [ 48, %39 ], [ 48, %35 ]
  %51 = getelementptr inbounds [34 x [34 x i8]], [34 x [34 x i8]] addrspace(3)* @_ZZ7operatePcS_iiE5local, i32 0, i32 %36, i32 %30
  store i8 %50, i8 addrspace(3)* %51, align 1, !tbaa !7
  %52 = add nsw i32 %37, 32
  %53 = sub nsw i32 %52, %27
  %54 = add nuw nsw i32 %53, %12
  %55 = icmp ult i32 %54, 34
  br i1 %55, label %35, label %56, !llvm.loop !10

56:                                               ; preds = %49, %29
  %57 = add nsw i32 %31, 32
  %58 = sub nsw i32 %57, %24
  %59 = add nuw nsw i32 %58, %20
  %60 = icmp ult i32 %59, 34
  br i1 %60, label %29, label %61, !llvm.loop !12

61:                                               ; preds = %56, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %62 = icmp slt i32 %13, %3
  %63 = icmp slt i32 %21, %2
  %64 = select i1 %62, i1 %63, i1 false
  br i1 %64, label %65, label %174

65:                                               ; preds = %61
  %66 = icmp ult i32 %12, 34
  br i1 %66, label %67, label %93

67:                                               ; preds = %65
  br i1 %25, label %68, label %73

68:                                               ; preds = %67
  %69 = getelementptr inbounds [34 x [34 x i8]], [34 x [34 x i8]] addrspace(3)* @_ZZ7operatePcS_iiE5local, i32 0, i32 %12, i32 %20
  %70 = load i8, i8 addrspace(3)* %69, align 1, !tbaa !7
  %71 = icmp eq i8 %70, 49
  %72 = zext i1 %71 to i32
  br label %73

73:                                               ; preds = %68, %67
  %74 = phi i32 [ 0, %67 ], [ %72, %68 ]
  %75 = icmp ult i32 %20, 33
  br i1 %75, label %76, label %83

76:                                               ; preds = %73
  %77 = add nuw nsw i32 %20, 1
  %78 = getelementptr inbounds [34 x [34 x i8]], [34 x [34 x i8]] addrspace(3)* @_ZZ7operatePcS_iiE5local, i32 0, i32 %12, i32 %77
  %79 = load i8, i8 addrspace(3)* %78, align 1, !tbaa !7
  %80 = icmp eq i8 %79, 49
  %81 = zext i1 %80 to i32
  %82 = add nuw nsw i32 %74, %81
  br label %83

83:                                               ; preds = %76, %73
  %84 = phi i32 [ %74, %73 ], [ %82, %76 ]
  %85 = icmp ult i32 %20, 32
  br i1 %85, label %86, label %93

86:                                               ; preds = %83
  %87 = add nuw nsw i32 %20, 2
  %88 = getelementptr inbounds [34 x [34 x i8]], [34 x [34 x i8]] addrspace(3)* @_ZZ7operatePcS_iiE5local, i32 0, i32 %12, i32 %87
  %89 = load i8, i8 addrspace(3)* %88, align 1, !tbaa !7
  %90 = icmp eq i8 %89, 49
  %91 = zext i1 %90 to i32
  %92 = add nuw nsw i32 %84, %91
  br label %93

93:                                               ; preds = %83, %86, %65
  %94 = phi i32 [ 0, %65 ], [ %84, %83 ], [ %92, %86 ]
  %95 = add nuw nsw i32 %12, 1
  %96 = icmp ult i32 %12, 33
  br i1 %96, label %97, label %124

97:                                               ; preds = %93
  br i1 %25, label %98, label %104

98:                                               ; preds = %97
  %99 = getelementptr inbounds [34 x [34 x i8]], [34 x [34 x i8]] addrspace(3)* @_ZZ7operatePcS_iiE5local, i32 0, i32 %95, i32 %20
  %100 = load i8, i8 addrspace(3)* %99, align 1, !tbaa !7
  %101 = icmp eq i8 %100, 49
  %102 = zext i1 %101 to i32
  %103 = add nuw nsw i32 %94, %102
  br label %104

104:                                              ; preds = %98, %97
  %105 = phi i32 [ %94, %97 ], [ %103, %98 ]
  %106 = icmp ult i32 %20, 33
  br i1 %106, label %107, label %114

107:                                              ; preds = %104
  %108 = add nuw nsw i32 %20, 1
  %109 = getelementptr inbounds [34 x [34 x i8]], [34 x [34 x i8]] addrspace(3)* @_ZZ7operatePcS_iiE5local, i32 0, i32 %95, i32 %108
  %110 = load i8, i8 addrspace(3)* %109, align 1, !tbaa !7
  %111 = icmp eq i8 %110, 49
  %112 = zext i1 %111 to i32
  %113 = add nuw nsw i32 %105, %112
  br label %114

114:                                              ; preds = %107, %104
  %115 = phi i32 [ %105, %104 ], [ %113, %107 ]
  %116 = icmp ult i32 %20, 32
  br i1 %116, label %117, label %124

117:                                              ; preds = %114
  %118 = add nuw nsw i32 %20, 2
  %119 = getelementptr inbounds [34 x [34 x i8]], [34 x [34 x i8]] addrspace(3)* @_ZZ7operatePcS_iiE5local, i32 0, i32 %95, i32 %118
  %120 = load i8, i8 addrspace(3)* %119, align 1, !tbaa !7
  %121 = icmp eq i8 %120, 49
  %122 = zext i1 %121 to i32
  %123 = add nuw nsw i32 %115, %122
  br label %124

124:                                              ; preds = %114, %117, %93
  %125 = phi i32 [ %94, %93 ], [ %115, %114 ], [ %123, %117 ]
  %126 = add nuw nsw i32 %12, 2
  %127 = icmp ult i32 %12, 32
  br i1 %127, label %128, label %155

128:                                              ; preds = %124
  br i1 %25, label %129, label %135

129:                                              ; preds = %128
  %130 = getelementptr inbounds [34 x [34 x i8]], [34 x [34 x i8]] addrspace(3)* @_ZZ7operatePcS_iiE5local, i32 0, i32 %126, i32 %20
  %131 = load i8, i8 addrspace(3)* %130, align 1, !tbaa !7
  %132 = icmp eq i8 %131, 49
  %133 = zext i1 %132 to i32
  %134 = add nuw nsw i32 %125, %133
  br label %135

135:                                              ; preds = %129, %128
  %136 = phi i32 [ %125, %128 ], [ %134, %129 ]
  %137 = icmp ult i32 %20, 33
  br i1 %137, label %138, label %145

138:                                              ; preds = %135
  %139 = add nuw nsw i32 %20, 1
  %140 = getelementptr inbounds [34 x [34 x i8]], [34 x [34 x i8]] addrspace(3)* @_ZZ7operatePcS_iiE5local, i32 0, i32 %126, i32 %139
  %141 = load i8, i8 addrspace(3)* %140, align 1, !tbaa !7
  %142 = icmp eq i8 %141, 49
  %143 = zext i1 %142 to i32
  %144 = add nuw nsw i32 %136, %143
  br label %145

145:                                              ; preds = %138, %135
  %146 = phi i32 [ %136, %135 ], [ %144, %138 ]
  %147 = icmp ult i32 %20, 32
  br i1 %147, label %148, label %155

148:                                              ; preds = %145
  %149 = add nuw nsw i32 %20, 2
  %150 = getelementptr inbounds [34 x [34 x i8]], [34 x [34 x i8]] addrspace(3)* @_ZZ7operatePcS_iiE5local, i32 0, i32 %126, i32 %149
  %151 = load i8, i8 addrspace(3)* %150, align 1, !tbaa !7
  %152 = icmp eq i8 %151, 49
  %153 = zext i1 %152 to i32
  %154 = add nuw nsw i32 %146, %153
  br label %155

155:                                              ; preds = %145, %148, %124
  %156 = phi i32 [ %125, %124 ], [ %146, %145 ], [ %154, %148 ]
  %157 = sext i32 %23 to i64
  %158 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %157
  %159 = load i8, i8 addrspace(1)* %158, align 1, !tbaa !7, !amdgpu.noclobber !5
  %160 = icmp eq i8 %159, 49
  %161 = sext i1 %160 to i32
  %162 = add nsw i32 %156, %161
  br i1 %160, label %163, label %169

163:                                              ; preds = %155
  %164 = add nsw i32 %162, -4
  %165 = icmp ult i32 %164, -2
  %166 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %157
  br i1 %165, label %167, label %168

167:                                              ; preds = %163
  store i8 48, i8 addrspace(1)* %166, align 1, !tbaa !7
  br label %174

168:                                              ; preds = %163
  store i8 49, i8 addrspace(1)* %166, align 1, !tbaa !7
  br label %174

169:                                              ; preds = %155
  %170 = icmp eq i32 %162, 3
  %171 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %157
  br i1 %170, label %172, label %173

172:                                              ; preds = %169
  store i8 49, i8 addrspace(1)* %171, align 1, !tbaa !7
  br label %174

173:                                              ; preds = %169
  store i8 48, i8 addrspace(1)* %171, align 1, !tbaa !7
  br label %174

174:                                              ; preds = %168, %167, %173, %172, %61
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
