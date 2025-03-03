; ModuleID = '../data/hip_kernels/818/19/main.cu'
source_filename = "../data/hip_kernels/818/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17gpu_grey_and_blurPhS_ii(i8 addrspace(1)* nocapture %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = icmp slt i32 %13, %2
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %51

25:                                               ; preds = %4
  %26 = mul nsw i32 %21, %2
  %27 = add nsw i32 %26, %13
  %28 = mul nsw i32 %27, 3
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %29
  %31 = load i8, i8 addrspace(1)* %30, align 1, !tbaa !7, !amdgpu.noclobber !6
  %32 = add nsw i32 %28, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %33
  %35 = load i8, i8 addrspace(1)* %34, align 1, !tbaa !7, !amdgpu.noclobber !6
  %36 = add nsw i32 %28, 2
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %37
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !7, !amdgpu.noclobber !6
  %40 = uitofp i8 %31 to float
  %41 = fmul contract float %40, 0x3FCAE147A0000000
  %42 = uitofp i8 %35 to float
  %43 = fmul contract float %42, 0x3FE6B851E0000000
  %44 = fadd contract float %41, %43
  %45 = uitofp i8 %39 to float
  %46 = fmul contract float %45, 0x3FB1EB8520000000
  %47 = fadd contract float %44, %46
  %48 = fptoui float %47 to i8
  %49 = sext i32 %27 to i64
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %49
  store i8 %48, i8 addrspace(1)* %50, align 1, !tbaa !7
  br label %51

51:                                               ; preds = %25, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %24, label %52, label %191

52:                                               ; preds = %51
  %53 = add nsw i32 %21, -1
  %54 = icmp sgt i32 %21, 0
  %55 = mul nsw i32 %53, %2
  %56 = add nsw i32 %13, -1
  br i1 %54, label %57, label %67

57:                                               ; preds = %52
  %58 = icmp sgt i32 %13, 0
  %59 = icmp sle i32 %13, %2
  %60 = select i1 %58, i1 %59, i1 false
  br i1 %60, label %61, label %67

61:                                               ; preds = %57
  %62 = add nsw i32 %56, %55
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %63
  %65 = load i8, i8 addrspace(1)* %64, align 1, !tbaa !7
  %66 = zext i8 %65 to i32
  br label %67

67:                                               ; preds = %61, %57, %52
  %68 = phi i32 [ 1, %61 ], [ 0, %57 ], [ 0, %52 ]
  %69 = phi i32 [ %66, %61 ], [ 0, %57 ], [ 0, %52 ]
  %70 = icmp sgt i32 %13, -1
  %71 = select i1 %54, i1 %70, i1 false
  br i1 %71, label %72, label %80

72:                                               ; preds = %67
  %73 = add nsw i32 %13, %55
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %74
  %76 = load i8, i8 addrspace(1)* %75, align 1, !tbaa !7
  %77 = zext i8 %76 to i32
  %78 = add nuw nsw i32 %69, %77
  %79 = add nuw nsw i32 %68, 1
  br label %80

80:                                               ; preds = %72, %67
  %81 = phi i32 [ %79, %72 ], [ %68, %67 ]
  %82 = phi i32 [ %78, %72 ], [ %69, %67 ]
  %83 = add nsw i32 %13, 1
  br i1 %54, label %84, label %96

84:                                               ; preds = %80
  %85 = icmp sgt i32 %13, -2
  %86 = icmp slt i32 %83, %2
  %87 = select i1 %85, i1 %86, i1 false
  br i1 %87, label %88, label %96

88:                                               ; preds = %84
  %89 = add nsw i32 %83, %55
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %90
  %92 = load i8, i8 addrspace(1)* %91, align 1, !tbaa !7
  %93 = zext i8 %92 to i32
  %94 = add nuw nsw i32 %82, %93
  %95 = add nuw nsw i32 %81, 1
  br label %96

96:                                               ; preds = %88, %84, %80
  %97 = phi i32 [ %95, %88 ], [ %81, %84 ], [ %81, %80 ]
  %98 = phi i32 [ %94, %88 ], [ %82, %84 ], [ %82, %80 ]
  %99 = icmp sgt i32 %21, -1
  %100 = mul nsw i32 %21, %2
  br i1 %99, label %101, label %113

101:                                              ; preds = %96
  %102 = icmp sgt i32 %13, 0
  %103 = icmp sle i32 %13, %2
  %104 = select i1 %102, i1 %103, i1 false
  br i1 %104, label %105, label %113

105:                                              ; preds = %101
  %106 = add nsw i32 %56, %100
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %107
  %109 = load i8, i8 addrspace(1)* %108, align 1, !tbaa !7
  %110 = zext i8 %109 to i32
  %111 = add nuw nsw i32 %98, %110
  %112 = add nuw nsw i32 %97, 1
  br label %113

113:                                              ; preds = %105, %101, %96
  %114 = phi i32 [ %112, %105 ], [ %97, %101 ], [ %97, %96 ]
  %115 = phi i32 [ %111, %105 ], [ %98, %101 ], [ %98, %96 ]
  %116 = icmp sgt i32 %13, -1
  %117 = select i1 %99, i1 %116, i1 false
  br i1 %117, label %118, label %126

118:                                              ; preds = %113
  %119 = add nsw i32 %13, %100
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %120
  %122 = load i8, i8 addrspace(1)* %121, align 1, !tbaa !7
  %123 = zext i8 %122 to i32
  %124 = add nuw nsw i32 %115, %123
  %125 = add nuw nsw i32 %114, 1
  br label %126

126:                                              ; preds = %118, %113
  %127 = phi i32 [ %125, %118 ], [ %114, %113 ]
  %128 = phi i32 [ %124, %118 ], [ %115, %113 ]
  br i1 %99, label %129, label %141

129:                                              ; preds = %126
  %130 = icmp sgt i32 %13, -2
  %131 = icmp slt i32 %83, %2
  %132 = select i1 %130, i1 %131, i1 false
  br i1 %132, label %133, label %141

133:                                              ; preds = %129
  %134 = add nsw i32 %83, %100
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %135
  %137 = load i8, i8 addrspace(1)* %136, align 1, !tbaa !7
  %138 = zext i8 %137 to i32
  %139 = add nuw nsw i32 %128, %138
  %140 = add nuw nsw i32 %127, 1
  br label %141

141:                                              ; preds = %133, %129, %126
  %142 = phi i32 [ %140, %133 ], [ %127, %129 ], [ %127, %126 ]
  %143 = phi i32 [ %139, %133 ], [ %128, %129 ], [ %128, %126 ]
  %144 = add nsw i32 %21, 1
  %145 = icmp sgt i32 %21, -2
  %146 = icmp slt i32 %144, %3
  %147 = mul nsw i32 %144, %2
  br i1 %145, label %148, label %161

148:                                              ; preds = %141
  %149 = icmp sgt i32 %13, 0
  %150 = select i1 %146, i1 %149, i1 false
  %151 = icmp sle i32 %13, %2
  %152 = select i1 %150, i1 %151, i1 false
  br i1 %152, label %153, label %161

153:                                              ; preds = %148
  %154 = add nsw i32 %56, %147
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %155
  %157 = load i8, i8 addrspace(1)* %156, align 1, !tbaa !7
  %158 = zext i8 %157 to i32
  %159 = add nuw nsw i32 %143, %158
  %160 = add nuw nsw i32 %142, 1
  br label %161

161:                                              ; preds = %153, %148, %141
  %162 = phi i1 [ %146, %153 ], [ %146, %148 ], [ false, %141 ]
  %163 = phi i32 [ %160, %153 ], [ %142, %148 ], [ %142, %141 ]
  %164 = phi i32 [ %159, %153 ], [ %143, %148 ], [ %143, %141 ]
  %165 = icmp sgt i32 %13, -1
  %166 = select i1 %162, i1 %165, i1 false
  br i1 %166, label %167, label %175

167:                                              ; preds = %161
  %168 = add nsw i32 %13, %147
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %169
  %171 = load i8, i8 addrspace(1)* %170, align 1, !tbaa !7
  %172 = zext i8 %171 to i32
  %173 = add nuw nsw i32 %164, %172
  %174 = add nuw nsw i32 %163, 1
  br label %175

175:                                              ; preds = %167, %161
  %176 = phi i32 [ %174, %167 ], [ %163, %161 ]
  %177 = phi i32 [ %173, %167 ], [ %164, %161 ]
  br i1 %145, label %178, label %191

178:                                              ; preds = %175
  %179 = icmp sgt i32 %13, -2
  %180 = select i1 %146, i1 %179, i1 false
  %181 = icmp slt i32 %83, %2
  %182 = select i1 %180, i1 %181, i1 false
  br i1 %182, label %183, label %191

183:                                              ; preds = %178
  %184 = add nsw i32 %83, %147
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %185
  %187 = load i8, i8 addrspace(1)* %186, align 1, !tbaa !7
  %188 = zext i8 %187 to i32
  %189 = add nuw nsw i32 %177, %188
  %190 = add nuw nsw i32 %176, 1
  br label %191

191:                                              ; preds = %175, %178, %183, %51
  %192 = phi i32 [ 0, %51 ], [ %190, %183 ], [ %176, %178 ], [ %176, %175 ]
  %193 = phi i32 [ 0, %51 ], [ %189, %183 ], [ %177, %178 ], [ %177, %175 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %24, label %194, label %203

194:                                              ; preds = %191
  %195 = trunc i32 %193 to i16
  %196 = trunc i32 %192 to i16
  %197 = udiv i16 %195, %196
  %198 = trunc i16 %197 to i8
  %199 = mul nsw i32 %21, %2
  %200 = add nsw i32 %199, %13
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %201
  store i8 %198, i8 addrspace(1)* %202, align 1, !tbaa !7
  br label %203

203:                                              ; preds = %194, %191
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
