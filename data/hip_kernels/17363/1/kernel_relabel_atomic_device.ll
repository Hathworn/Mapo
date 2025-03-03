; ModuleID = '../data/hip_kernels/17363/1/main.cu'
source_filename = "../data/hip_kernels/17363/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ21kernel_relabel_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn = internal unnamed_addr addrspace(3) global [356 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z21kernel_relabel_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readnone %6, i32 addrspace(1)* nocapture readnone %7, i32 addrspace(1)* nocapture readnone %8, i32 addrspace(1)* nocapture readnone %9, i32 addrspace(1)* nocapture writeonly %10, i32 addrspace(1)* nocapture readonly %11, i32 addrspace(1)* nocapture writeonly %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18) local_unnamed_addr #0 {
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %24 = getelementptr i8, i8 addrspace(4)* %23, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !5, !invariant.load !6
  %27 = zext i16 %26 to i32
  %28 = and i32 %22, 16777215
  %29 = mul i32 %28, %27
  %30 = add i32 %29, %20
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %32 = getelementptr i8, i8 addrspace(4)* %23, i64 6
  %33 = bitcast i8 addrspace(4)* %32 to i16 addrspace(4)*
  %34 = load i16, i16 addrspace(4)* %33, align 2, !range !5, !invariant.load !6
  %35 = zext i16 %34 to i32
  %36 = and i32 %31, 16777215
  %37 = mul i32 %36, %35
  %38 = add i32 %37, %21
  %39 = and i32 %38, 16777215
  %40 = and i32 %17, 16777215
  %41 = mul i32 %39, %40
  %42 = add nsw i32 %41, %30
  %43 = mul nuw nsw i32 %21, 34
  %44 = add nuw nsw i32 %20, 34
  %45 = add nuw nsw i32 %44, %43
  %46 = add nuw nsw i32 %45, 1
  %47 = sext i32 %42 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ21kernel_relabel_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %46
  store i32 %49, i32 addrspace(3)* %50, align 4, !tbaa !7
  %51 = icmp eq i32 %20, 31
  %52 = add nsw i32 %17, -1
  %53 = icmp slt i32 %30, %52
  %54 = select i1 %51, i1 %53, i1 false
  br i1 %54, label %55, label %62

55:                                               ; preds = %19
  %56 = add nsw i32 %42, 1
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !6
  %60 = add nuw nsw i32 %45, 2
  %61 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ21kernel_relabel_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %60
  store i32 %59, i32 addrspace(3)* %61, align 4, !tbaa !7
  br label %62

62:                                               ; preds = %19, %55
  %63 = icmp eq i32 %20, 0
  %64 = icmp sgt i32 %30, 0
  %65 = select i1 %63, i1 %64, i1 false
  br i1 %65, label %66, label %72

66:                                               ; preds = %62
  %67 = add nsw i32 %42, -1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !6
  %71 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ21kernel_relabel_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %45
  store i32 %70, i32 addrspace(3)* %71, align 4, !tbaa !7
  br label %72

72:                                               ; preds = %62, %66
  %73 = icmp eq i32 %21, 7
  %74 = add nsw i32 %18, -1
  %75 = icmp slt i32 %38, %74
  %76 = select i1 %73, i1 %75, i1 false
  br i1 %76, label %77, label %84

77:                                               ; preds = %72
  %78 = add nsw i32 %42, %17
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !6
  %82 = add nuw nsw i32 %45, 35
  %83 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ21kernel_relabel_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %82
  store i32 %81, i32 addrspace(3)* %83, align 4, !tbaa !7
  br label %84

84:                                               ; preds = %72, %77
  %85 = icmp eq i32 %21, 0
  %86 = icmp sgt i32 %38, 0
  %87 = select i1 %85, i1 %86, i1 false
  br i1 %87, label %88, label %95

88:                                               ; preds = %84
  %89 = sub nsw i32 %42, %17
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %90
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !6
  %93 = add nsw i32 %45, -33
  %94 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ21kernel_relabel_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %93
  store i32 %92, i32 addrspace(3)* %94, align 4, !tbaa !7
  br label %95

95:                                               ; preds = %84, %88
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !6
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %47
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !6
  %100 = icmp slt i32 %99, 1
  br i1 %100, label %164, label %101

101:                                              ; preds = %95
  %102 = icmp eq i32 %97, 0
  br i1 %102, label %103, label %119

103:                                              ; preds = %101
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %105 = load i32, i32 addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !6
  %106 = icmp eq i32 %105, 0
  br i1 %106, label %107, label %119

107:                                              ; preds = %103
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %47
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !6
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %111, label %119

111:                                              ; preds = %107
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %47
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !6
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %115, label %119

115:                                              ; preds = %111
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %47
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !6
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %164, label %119

119:                                              ; preds = %101, %103, %107, %111, %115
  %120 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %121 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ21kernel_relabel_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %45
  %122 = load i32, i32 addrspace(3)* %121, align 4, !tbaa !7
  %123 = add nsw i32 %122, 1
  %124 = icmp eq i32 %120, %123
  %125 = icmp sgt i32 %97, 0
  %126 = select i1 %124, i1 %125, i1 false
  br i1 %126, label %164, label %127

127:                                              ; preds = %119
  %128 = add nuw nsw i32 %45, 2
  %129 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ21kernel_relabel_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %128
  %130 = load i32, i32 addrspace(3)* %129, align 4, !tbaa !7
  %131 = add nsw i32 %130, 1
  %132 = icmp eq i32 %120, %131
  br i1 %132, label %133, label %137

133:                                              ; preds = %127
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %135 = load i32, i32 addrspace(1)* %134, align 4, !tbaa !7, !amdgpu.noclobber !6
  %136 = icmp sgt i32 %135, 0
  br i1 %136, label %164, label %137

137:                                              ; preds = %133, %127
  %138 = add nuw nsw i32 %45, 35
  %139 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ21kernel_relabel_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %138
  %140 = load i32, i32 addrspace(3)* %139, align 4, !tbaa !7
  %141 = add nsw i32 %140, 1
  %142 = icmp eq i32 %120, %141
  br i1 %142, label %143, label %147

143:                                              ; preds = %137
  %144 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %47
  %145 = load i32, i32 addrspace(1)* %144, align 4, !tbaa !7, !amdgpu.noclobber !6
  %146 = icmp sgt i32 %145, 0
  br i1 %146, label %164, label %147

147:                                              ; preds = %143, %137
  %148 = add nsw i32 %45, -33
  %149 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ21kernel_relabel_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %148
  %150 = load i32, i32 addrspace(3)* %149, align 4, !tbaa !7
  %151 = add nsw i32 %150, 1
  %152 = icmp eq i32 %120, %151
  br i1 %152, label %153, label %157

153:                                              ; preds = %147
  %154 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %47
  %155 = load i32, i32 addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !6
  %156 = icmp sgt i32 %155, 0
  br i1 %156, label %164, label %157

157:                                              ; preds = %153, %147
  %158 = icmp eq i32 %120, 1
  br i1 %158, label %159, label %163

159:                                              ; preds = %157
  %160 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %47
  %161 = load i32, i32 addrspace(1)* %160, align 4, !tbaa !7, !amdgpu.noclobber !6
  %162 = icmp sgt i32 %161, 0
  br i1 %162, label %164, label %163

163:                                              ; preds = %159, %157
  br label %164

164:                                              ; preds = %133, %143, %153, %159, %119, %95, %115, %163
  %165 = phi i32 [ 0, %163 ], [ 2, %115 ], [ 2, %95 ], [ 1, %119 ], [ 1, %159 ], [ 1, %153 ], [ 1, %143 ], [ 1, %133 ]
  %166 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %47
  store i32 %165, i32 addrspace(1)* %166, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %167 = icmp slt i32 %42, %16
  br i1 %167, label %168, label %222

168:                                              ; preds = %164
  %169 = add nsw i32 %14, -1
  %170 = icmp slt i32 %30, %169
  %171 = and i1 %170, %64
  br i1 %171, label %172, label %222

172:                                              ; preds = %168
  %173 = add nsw i32 %15, -1
  %174 = icmp slt i32 %38, %173
  %175 = and i1 %174, %86
  br i1 %175, label %176, label %222

176:                                              ; preds = %172
  %177 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %47
  %178 = load i32, i32 addrspace(1)* %177, align 4, !tbaa !7
  %179 = icmp sgt i32 %178, 0
  br i1 %179, label %219, label %180

180:                                              ; preds = %176
  %181 = icmp sgt i32 %97, 0
  br i1 %181, label %182, label %186

182:                                              ; preds = %180
  %183 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ21kernel_relabel_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %45
  %184 = load i32, i32 addrspace(3)* %183, align 4, !tbaa !7
  %185 = tail call i32 @llvm.smin.i32(i32 %184, i32 %13)
  br label %186

186:                                              ; preds = %182, %180
  %187 = phi i32 [ %13, %180 ], [ %185, %182 ]
  %188 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %189 = load i32, i32 addrspace(1)* %188, align 4, !tbaa !7
  %190 = icmp sgt i32 %189, 0
  br i1 %190, label %191, label %196

191:                                              ; preds = %186
  %192 = add nuw nsw i32 %45, 2
  %193 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ21kernel_relabel_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %192
  %194 = load i32, i32 addrspace(3)* %193, align 4, !tbaa !7
  %195 = tail call i32 @llvm.smin.i32(i32 %187, i32 %194)
  br label %196

196:                                              ; preds = %191, %186
  %197 = phi i32 [ %187, %186 ], [ %195, %191 ]
  %198 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %47
  %199 = load i32, i32 addrspace(1)* %198, align 4, !tbaa !7
  %200 = icmp sgt i32 %199, 0
  br i1 %200, label %201, label %206

201:                                              ; preds = %196
  %202 = add nuw nsw i32 %45, 35
  %203 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ21kernel_relabel_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %202
  %204 = load i32, i32 addrspace(3)* %203, align 4, !tbaa !7
  %205 = tail call i32 @llvm.smin.i32(i32 %197, i32 %204)
  br label %206

206:                                              ; preds = %201, %196
  %207 = phi i32 [ %197, %196 ], [ %205, %201 ]
  %208 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %47
  %209 = load i32, i32 addrspace(1)* %208, align 4, !tbaa !7
  %210 = icmp sgt i32 %209, 0
  br i1 %210, label %211, label %216

211:                                              ; preds = %206
  %212 = add nsw i32 %45, -33
  %213 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ21kernel_relabel_atomicPiS_S_S_S_S_S_S_S_S_S_S_S_iiiiiiE9height_fn, i32 0, i32 %212
  %214 = load i32, i32 addrspace(3)* %213, align 4, !tbaa !7
  %215 = tail call i32 @llvm.smin.i32(i32 %207, i32 %214)
  br label %216

216:                                              ; preds = %211, %206
  %217 = phi i32 [ %207, %206 ], [ %215, %211 ]
  %218 = add nsw i32 %217, 1
  br label %219

219:                                              ; preds = %176, %216
  %220 = phi i32 [ %218, %216 ], [ 1, %176 ]
  %221 = getelementptr inbounds i32, i32 addrspace(1)* %12, i64 %47
  store i32 %220, i32 addrspace(1)* %221, align 4, !tbaa !7
  br label %222

222:                                              ; preds = %219, %172, %168, %164
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
