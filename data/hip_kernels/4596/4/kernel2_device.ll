; ModuleID = '../data/hip_kernels/4596/4/main.cu'
source_filename = "../data/hip_kernels/4596/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7kernel2PiS_i(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = icmp eq i32 %4, 0
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %10, %2
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = icmp ult i32 %14, %2
  br i1 %5, label %16, label %34

16:                                               ; preds = %3
  br i1 %15, label %26, label %17

17:                                               ; preds = %16
  %18 = add i32 %14, 1
  %19 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add i32 %23, %24
  br label %52

26:                                               ; preds = %16
  %27 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %28 = bitcast i8 addrspace(4)* %27 to i16 addrspace(4)*
  %29 = load i16, i16 addrspace(4)* %28, align 4, !range !4, !invariant.load !5
  %30 = zext i16 %29 to i32
  %31 = mul i32 %14, %30
  %32 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %33 = add i32 %31, %32
  br label %52

34:                                               ; preds = %3
  br i1 %15, label %44, label %35

35:                                               ; preds = %34
  %36 = add i32 %14, 1
  %37 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %38 = bitcast i8 addrspace(4)* %37 to i16 addrspace(4)*
  %39 = load i16, i16 addrspace(4)* %38, align 4, !range !4, !invariant.load !5
  %40 = zext i16 %39 to i32
  %41 = mul i32 %36, %40
  %42 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %43 = add i32 %41, %42
  br label %52

44:                                               ; preds = %34
  %45 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %46 = bitcast i8 addrspace(4)* %45 to i16 addrspace(4)*
  %47 = load i16, i16 addrspace(4)* %46, align 4, !range !4, !invariant.load !5
  %48 = zext i16 %47 to i32
  %49 = mul i32 %14, %48
  %50 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %51 = add i32 %49, %50
  br label %52

52:                                               ; preds = %35, %44, %17, %26
  %53 = phi i32 [ %13, %17 ], [ %13, %26 ], [ %43, %35 ], [ %51, %44 ]
  %54 = phi i32 [ %25, %17 ], [ %33, %26 ], [ %13, %35 ], [ %13, %44 ]
  %55 = shl i32 %2, 3
  %56 = add i32 %55, 8
  %57 = icmp eq i32 %55, 2147483640
  br i1 %57, label %79, label %58

58:                                               ; preds = %52
  %59 = shl nsw i32 %54, 8
  %60 = add nsw i32 %59, %53
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %61
  %64 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7
  %65 = sitofp i32 %64 to float
  %66 = add nsw i32 %55, %59
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7
  %70 = sitofp i32 %69 to float
  %71 = shl i32 %2, 11
  %72 = add nsw i32 %71, %53
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !7
  %76 = sitofp i32 %75 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %77 = fadd contract float %70, %76
  %78 = fcmp contract olt float %77, %65
  br i1 %78, label %80, label %82

79:                                               ; preds = %198, %215, %82, %52
  ret void

80:                                               ; preds = %58
  %81 = fptosi float %77 to i32
  store i32 %81, i32 addrspace(1)* %62, align 4, !tbaa !7
  store i32 %55, i32 addrspace(1)* %63, align 4, !tbaa !7
  br label %82

82:                                               ; preds = %58, %80
  %83 = add nuw nsw i32 %55, 1
  %84 = icmp slt i32 %83, %56
  br i1 %84, label %85, label %79, !llvm.loop !11

85:                                               ; preds = %82
  %86 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7
  %87 = sitofp i32 %86 to float
  %88 = add nsw i32 %83, %59
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !7
  %92 = sitofp i32 %91 to float
  %93 = shl nsw i32 %83, 8
  %94 = add nsw i32 %93, %53
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7
  %98 = sitofp i32 %97 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %99 = fadd contract float %92, %98
  %100 = fcmp contract olt float %99, %87
  br i1 %100, label %101, label %103

101:                                              ; preds = %85
  %102 = fptosi float %99 to i32
  store i32 %102, i32 addrspace(1)* %62, align 4, !tbaa !7
  store i32 %83, i32 addrspace(1)* %63, align 4, !tbaa !7
  br label %103

103:                                              ; preds = %101, %85
  %104 = add nuw nsw i32 %55, 2
  %105 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7
  %106 = sitofp i32 %105 to float
  %107 = add nsw i32 %104, %59
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %108
  %110 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !7
  %111 = sitofp i32 %110 to float
  %112 = shl nsw i32 %104, 8
  %113 = add nsw i32 %112, %53
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !7
  %117 = sitofp i32 %116 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %118 = fadd contract float %111, %117
  %119 = fcmp contract olt float %118, %106
  br i1 %119, label %120, label %122

120:                                              ; preds = %103
  %121 = fptosi float %118 to i32
  store i32 %121, i32 addrspace(1)* %62, align 4, !tbaa !7
  store i32 %104, i32 addrspace(1)* %63, align 4, !tbaa !7
  br label %122

122:                                              ; preds = %120, %103
  %123 = add nuw nsw i32 %55, 3
  %124 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7
  %125 = sitofp i32 %124 to float
  %126 = add nsw i32 %123, %59
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %127
  %129 = load i32, i32 addrspace(1)* %128, align 4, !tbaa !7
  %130 = sitofp i32 %129 to float
  %131 = shl nsw i32 %123, 8
  %132 = add nsw i32 %131, %53
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %133
  %135 = load i32, i32 addrspace(1)* %134, align 4, !tbaa !7
  %136 = sitofp i32 %135 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %137 = fadd contract float %130, %136
  %138 = fcmp contract olt float %137, %125
  br i1 %138, label %139, label %141

139:                                              ; preds = %122
  %140 = fptosi float %137 to i32
  store i32 %140, i32 addrspace(1)* %62, align 4, !tbaa !7
  store i32 %123, i32 addrspace(1)* %63, align 4, !tbaa !7
  br label %141

141:                                              ; preds = %139, %122
  %142 = add nuw nsw i32 %55, 4
  %143 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7
  %144 = sitofp i32 %143 to float
  %145 = add nsw i32 %142, %59
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %146
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !7
  %149 = sitofp i32 %148 to float
  %150 = shl nsw i32 %142, 8
  %151 = add nsw i32 %150, %53
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %152
  %154 = load i32, i32 addrspace(1)* %153, align 4, !tbaa !7
  %155 = sitofp i32 %154 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %156 = fadd contract float %149, %155
  %157 = fcmp contract olt float %156, %144
  br i1 %157, label %158, label %160

158:                                              ; preds = %141
  %159 = fptosi float %156 to i32
  store i32 %159, i32 addrspace(1)* %62, align 4, !tbaa !7
  store i32 %142, i32 addrspace(1)* %63, align 4, !tbaa !7
  br label %160

160:                                              ; preds = %158, %141
  %161 = add nuw nsw i32 %55, 5
  %162 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7
  %163 = sitofp i32 %162 to float
  %164 = add nsw i32 %161, %59
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %165
  %167 = load i32, i32 addrspace(1)* %166, align 4, !tbaa !7
  %168 = sitofp i32 %167 to float
  %169 = shl nsw i32 %161, 8
  %170 = add nsw i32 %169, %53
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %171
  %173 = load i32, i32 addrspace(1)* %172, align 4, !tbaa !7
  %174 = sitofp i32 %173 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %175 = fadd contract float %168, %174
  %176 = fcmp contract olt float %175, %163
  br i1 %176, label %177, label %179

177:                                              ; preds = %160
  %178 = fptosi float %175 to i32
  store i32 %178, i32 addrspace(1)* %62, align 4, !tbaa !7
  store i32 %161, i32 addrspace(1)* %63, align 4, !tbaa !7
  br label %179

179:                                              ; preds = %177, %160
  %180 = add nuw nsw i32 %55, 6
  %181 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7
  %182 = sitofp i32 %181 to float
  %183 = add nsw i32 %180, %59
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %184
  %186 = load i32, i32 addrspace(1)* %185, align 4, !tbaa !7
  %187 = sitofp i32 %186 to float
  %188 = shl nsw i32 %180, 8
  %189 = add nsw i32 %188, %53
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %190
  %192 = load i32, i32 addrspace(1)* %191, align 4, !tbaa !7
  %193 = sitofp i32 %192 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %194 = fadd contract float %187, %193
  %195 = fcmp contract olt float %194, %182
  br i1 %195, label %196, label %198

196:                                              ; preds = %179
  %197 = fptosi float %194 to i32
  store i32 %197, i32 addrspace(1)* %62, align 4, !tbaa !7
  store i32 %180, i32 addrspace(1)* %63, align 4, !tbaa !7
  br label %198

198:                                              ; preds = %196, %179
  %199 = add nuw nsw i32 %55, 7
  %200 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7
  %201 = sitofp i32 %200 to float
  %202 = add nsw i32 %199, %59
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %203
  %205 = load i32, i32 addrspace(1)* %204, align 4, !tbaa !7
  %206 = sitofp i32 %205 to float
  %207 = shl nsw i32 %199, 8
  %208 = add nsw i32 %207, %53
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %209
  %211 = load i32, i32 addrspace(1)* %210, align 4, !tbaa !7
  %212 = sitofp i32 %211 to float
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %213 = fadd contract float %206, %212
  %214 = fcmp contract olt float %213, %201
  br i1 %214, label %215, label %79

215:                                              ; preds = %198
  %216 = fptosi float %213 to i32
  store i32 %216, i32 addrspace(1)* %62, align 4, !tbaa !7
  store i32 %199, i32 addrspace(1)* %63, align 4, !tbaa !7
  br label %79
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
