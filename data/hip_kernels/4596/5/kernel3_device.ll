; ModuleID = '../data/hip_kernels/4596/5/main.cu'
source_filename = "../data/hip_kernels/4596/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7kernel3PiS_i(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = icmp uge i32 %5, %2
  %7 = zext i1 %6 to i32
  %8 = add i32 %5, %7
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %16 = add i32 %14, %15
  %17 = shl i32 %2, 3
  %18 = add i32 %17, 8
  %19 = icmp eq i32 %17, 2147483640
  br i1 %19, label %52, label %20

20:                                               ; preds = %3
  %21 = icmp uge i32 %4, %2
  %22 = zext i1 %21 to i32
  %23 = add i32 %4, %22
  %24 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %25 = getelementptr i8, i8 addrspace(4)* %24, i64 4
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 4, !range !4, !invariant.load !5
  %28 = zext i16 %27 to i32
  %29 = mul i32 %23, %28
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %31 = add i32 %29, %30
  %32 = shl nsw i32 %31, 8
  %33 = add nsw i32 %16, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %34
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %34
  %37 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7
  %38 = sitofp i32 %37 to float
  %39 = add nsw i32 %17, %32
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7
  %43 = sitofp i32 %42 to float
  %44 = shl i32 %2, 11
  %45 = add nsw i32 %44, %16
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7
  %49 = sitofp i32 %48 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %50 = fadd contract float %43, %49
  %51 = fcmp contract olt float %50, %38
  br i1 %51, label %53, label %55

52:                                               ; preds = %171, %188, %55, %3
  ret void

53:                                               ; preds = %20
  %54 = fptosi float %50 to i32
  store i32 %54, i32 addrspace(1)* %35, align 4, !tbaa !7
  store i32 %17, i32 addrspace(1)* %36, align 4, !tbaa !7
  br label %55

55:                                               ; preds = %20, %53
  %56 = add nuw nsw i32 %17, 1
  %57 = icmp slt i32 %56, %18
  br i1 %57, label %58, label %52, !llvm.loop !11

58:                                               ; preds = %55
  %59 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7
  %60 = sitofp i32 %59 to float
  %61 = add nsw i32 %56, %32
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7
  %65 = sitofp i32 %64 to float
  %66 = shl nsw i32 %56, 8
  %67 = add nsw i32 %66, %16
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7
  %71 = sitofp i32 %70 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %72 = fadd contract float %65, %71
  %73 = fcmp contract olt float %72, %60
  br i1 %73, label %74, label %76

74:                                               ; preds = %58
  %75 = fptosi float %72 to i32
  store i32 %75, i32 addrspace(1)* %35, align 4, !tbaa !7
  store i32 %56, i32 addrspace(1)* %36, align 4, !tbaa !7
  br label %76

76:                                               ; preds = %74, %58
  %77 = add nuw nsw i32 %17, 2
  %78 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7
  %79 = sitofp i32 %78 to float
  %80 = add nsw i32 %77, %32
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7
  %84 = sitofp i32 %83 to float
  %85 = shl nsw i32 %77, 8
  %86 = add nsw i32 %85, %16
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !7
  %90 = sitofp i32 %89 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %91 = fadd contract float %84, %90
  %92 = fcmp contract olt float %91, %79
  br i1 %92, label %93, label %95

93:                                               ; preds = %76
  %94 = fptosi float %91 to i32
  store i32 %94, i32 addrspace(1)* %35, align 4, !tbaa !7
  store i32 %77, i32 addrspace(1)* %36, align 4, !tbaa !7
  br label %95

95:                                               ; preds = %93, %76
  %96 = add nuw nsw i32 %17, 3
  %97 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7
  %98 = sitofp i32 %97 to float
  %99 = add nsw i32 %96, %32
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !7
  %103 = sitofp i32 %102 to float
  %104 = shl nsw i32 %96, 8
  %105 = add nsw i32 %104, %16
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !7
  %109 = sitofp i32 %108 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %110 = fadd contract float %103, %109
  %111 = fcmp contract olt float %110, %98
  br i1 %111, label %112, label %114

112:                                              ; preds = %95
  %113 = fptosi float %110 to i32
  store i32 %113, i32 addrspace(1)* %35, align 4, !tbaa !7
  store i32 %96, i32 addrspace(1)* %36, align 4, !tbaa !7
  br label %114

114:                                              ; preds = %112, %95
  %115 = add nuw nsw i32 %17, 4
  %116 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7
  %117 = sitofp i32 %116 to float
  %118 = add nsw i32 %115, %32
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !7
  %122 = sitofp i32 %121 to float
  %123 = shl nsw i32 %115, 8
  %124 = add nsw i32 %123, %16
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %125
  %127 = load i32, i32 addrspace(1)* %126, align 4, !tbaa !7
  %128 = sitofp i32 %127 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %129 = fadd contract float %122, %128
  %130 = fcmp contract olt float %129, %117
  br i1 %130, label %131, label %133

131:                                              ; preds = %114
  %132 = fptosi float %129 to i32
  store i32 %132, i32 addrspace(1)* %35, align 4, !tbaa !7
  store i32 %115, i32 addrspace(1)* %36, align 4, !tbaa !7
  br label %133

133:                                              ; preds = %131, %114
  %134 = add nuw nsw i32 %17, 5
  %135 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7
  %136 = sitofp i32 %135 to float
  %137 = add nsw i32 %134, %32
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %138
  %140 = load i32, i32 addrspace(1)* %139, align 4, !tbaa !7
  %141 = sitofp i32 %140 to float
  %142 = shl nsw i32 %134, 8
  %143 = add nsw i32 %142, %16
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %144
  %146 = load i32, i32 addrspace(1)* %145, align 4, !tbaa !7
  %147 = sitofp i32 %146 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %148 = fadd contract float %141, %147
  %149 = fcmp contract olt float %148, %136
  br i1 %149, label %150, label %152

150:                                              ; preds = %133
  %151 = fptosi float %148 to i32
  store i32 %151, i32 addrspace(1)* %35, align 4, !tbaa !7
  store i32 %134, i32 addrspace(1)* %36, align 4, !tbaa !7
  br label %152

152:                                              ; preds = %150, %133
  %153 = add nuw nsw i32 %17, 6
  %154 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7
  %155 = sitofp i32 %154 to float
  %156 = add nsw i32 %153, %32
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %157
  %159 = load i32, i32 addrspace(1)* %158, align 4, !tbaa !7
  %160 = sitofp i32 %159 to float
  %161 = shl nsw i32 %153, 8
  %162 = add nsw i32 %161, %16
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %163
  %165 = load i32, i32 addrspace(1)* %164, align 4, !tbaa !7
  %166 = sitofp i32 %165 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %167 = fadd contract float %160, %166
  %168 = fcmp contract olt float %167, %155
  br i1 %168, label %169, label %171

169:                                              ; preds = %152
  %170 = fptosi float %167 to i32
  store i32 %170, i32 addrspace(1)* %35, align 4, !tbaa !7
  store i32 %153, i32 addrspace(1)* %36, align 4, !tbaa !7
  br label %171

171:                                              ; preds = %169, %152
  %172 = add nuw nsw i32 %17, 7
  %173 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7
  %174 = sitofp i32 %173 to float
  %175 = add nsw i32 %172, %32
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %176
  %178 = load i32, i32 addrspace(1)* %177, align 4, !tbaa !7
  %179 = sitofp i32 %178 to float
  %180 = shl nsw i32 %172, 8
  %181 = add nsw i32 %180, %16
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %182
  %184 = load i32, i32 addrspace(1)* %183, align 4, !tbaa !7
  %185 = sitofp i32 %184 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %186 = fadd contract float %179, %185
  %187 = fcmp contract olt float %186, %174
  br i1 %187, label %188, label %52

188:                                              ; preds = %171
  %189 = fptosi float %186 to i32
  store i32 %189, i32 addrspace(1)* %35, align 4, !tbaa !7
  store i32 %172, i32 addrspace(1)* %36, align 4, !tbaa !7
  br label %52
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
