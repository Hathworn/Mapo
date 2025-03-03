; ModuleID = '../data/hip_kernels/219/31/main.cu'
source_filename = "../data/hip_kernels/219/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s_counter = external hidden addrspace(3) global [0 x i32], align 4

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z31make_and_count_seg_sharedAtomicPfPiS0_iiiiiifff(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, float %9, float %10, float %11) local_unnamed_addr #0 {
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = mul i32 %18, %17
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = mul nsw i32 %21, %6
  %23 = icmp sgt i32 %22, %5
  %24 = sub nsw i32 %21, %7
  %25 = add nsw i32 %24, 1
  %26 = mul nsw i32 %25, %8
  %27 = add nsw i32 %26, %5
  %28 = icmp slt i32 %27, %3
  %29 = and i1 %23, %28
  %30 = mul nsw i32 %24, %8
  %31 = add nsw i32 %30, %5
  %32 = select i1 %29, i32 %8, i32 %6
  %33 = select i1 %29, i32 %31, i32 %22
  %34 = mul nsw i32 %21, %4
  %35 = sext i32 %33 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %35
  %38 = sext i32 %34 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %38
  %40 = icmp sgt i32 %32, 0
  br i1 %40, label %41, label %77

41:                                               ; preds = %12
  %42 = add nsw i32 %4, -1
  %43 = and i32 %32, 3
  %44 = icmp ult i32 %32, 4
  br i1 %44, label %47, label %45

45:                                               ; preds = %41
  %46 = and i32 %32, -4
  br label %84

47:                                               ; preds = %169, %41
  %48 = phi i32 [ 0, %41 ], [ %174, %169 ]
  %49 = icmp eq i32 %43, 0
  br i1 %49, label %77, label %50

50:                                               ; preds = %47, %69
  %51 = phi i32 [ %74, %69 ], [ %48, %47 ]
  %52 = phi i32 [ %75, %69 ], [ 0, %47 ]
  %53 = zext i32 %51 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %36, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = tail call float @llvm.fabs.f32(float %55)
  %57 = fcmp contract ogt float %56, %9
  %58 = fcmp contract olt float %56, %10
  %59 = and i1 %57, %58
  br i1 %59, label %63, label %60

60:                                               ; preds = %50
  %61 = fcmp contract ult float %56, %10
  %62 = select i1 %61, i32 %42, i32 0
  br label %69

63:                                               ; preds = %50
  %64 = fsub contract float %10, %56
  %65 = tail call float @llvm.fabs.f32(float %64)
  %66 = fmul contract float %65, %11
  %67 = tail call float @llvm.ceil.f32(float %66)
  %68 = fptosi float %67 to i32
  br label %69

69:                                               ; preds = %63, %60
  %70 = phi i32 [ %68, %63 ], [ %62, %60 ]
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %53
  store i32 %70, i32 addrspace(1)* %71, align 4, !tbaa !11
  %72 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_counter, i32 0, i32 %70
  %73 = atomicrmw add i32 addrspace(3)* %72, i32 1 syncscope("agent-one-as") monotonic, align 4
  %74 = add nuw nsw i32 %51, 1
  %75 = add i32 %52, 1
  %76 = icmp eq i32 %75, %43
  br i1 %76, label %77, label %50, !llvm.loop !13

77:                                               ; preds = %47, %69, %12
  %78 = icmp sgt i32 %4, 0
  br i1 %78, label %79, label %235

79:                                               ; preds = %77
  %80 = and i32 %4, 7
  %81 = icmp ult i32 %4, 8
  br i1 %81, label %222, label %82

82:                                               ; preds = %79
  %83 = and i32 %4, -8
  br label %177

84:                                               ; preds = %169, %45
  %85 = phi i32 [ 0, %45 ], [ %174, %169 ]
  %86 = phi i32 [ 0, %45 ], [ %175, %169 ]
  %87 = zext i32 %85 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %36, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = tail call float @llvm.fabs.f32(float %89)
  %91 = fcmp contract ogt float %90, %9
  %92 = fcmp contract olt float %90, %10
  %93 = and i1 %91, %92
  br i1 %93, label %94, label %100

94:                                               ; preds = %84
  %95 = fsub contract float %10, %90
  %96 = tail call float @llvm.fabs.f32(float %95)
  %97 = fmul contract float %96, %11
  %98 = tail call float @llvm.ceil.f32(float %97)
  %99 = fptosi float %98 to i32
  br label %103

100:                                              ; preds = %84
  %101 = fcmp contract ult float %90, %10
  %102 = select i1 %101, i32 %42, i32 0
  br label %103

103:                                              ; preds = %100, %94
  %104 = phi i32 [ %99, %94 ], [ %102, %100 ]
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %87
  store i32 %104, i32 addrspace(1)* %105, align 4, !tbaa !11
  %106 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_counter, i32 0, i32 %104
  %107 = atomicrmw add i32 addrspace(3)* %106, i32 1 syncscope("agent-one-as") monotonic, align 4
  %108 = or i32 %85, 1
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %36, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = tail call float @llvm.fabs.f32(float %111)
  %113 = fcmp contract ogt float %112, %9
  %114 = fcmp contract olt float %112, %10
  %115 = and i1 %113, %114
  br i1 %115, label %119, label %116

116:                                              ; preds = %103
  %117 = fcmp contract ult float %112, %10
  %118 = select i1 %117, i32 %42, i32 0
  br label %125

119:                                              ; preds = %103
  %120 = fsub contract float %10, %112
  %121 = tail call float @llvm.fabs.f32(float %120)
  %122 = fmul contract float %121, %11
  %123 = tail call float @llvm.ceil.f32(float %122)
  %124 = fptosi float %123 to i32
  br label %125

125:                                              ; preds = %119, %116
  %126 = phi i32 [ %124, %119 ], [ %118, %116 ]
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %109
  store i32 %126, i32 addrspace(1)* %127, align 4, !tbaa !11
  %128 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_counter, i32 0, i32 %126
  %129 = atomicrmw add i32 addrspace(3)* %128, i32 1 syncscope("agent-one-as") monotonic, align 4
  %130 = or i32 %85, 2
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %36, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !5
  %134 = tail call float @llvm.fabs.f32(float %133)
  %135 = fcmp contract ogt float %134, %9
  %136 = fcmp contract olt float %134, %10
  %137 = and i1 %135, %136
  br i1 %137, label %141, label %138

138:                                              ; preds = %125
  %139 = fcmp contract ult float %134, %10
  %140 = select i1 %139, i32 %42, i32 0
  br label %147

141:                                              ; preds = %125
  %142 = fsub contract float %10, %134
  %143 = tail call float @llvm.fabs.f32(float %142)
  %144 = fmul contract float %143, %11
  %145 = tail call float @llvm.ceil.f32(float %144)
  %146 = fptosi float %145 to i32
  br label %147

147:                                              ; preds = %141, %138
  %148 = phi i32 [ %146, %141 ], [ %140, %138 ]
  %149 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %131
  store i32 %148, i32 addrspace(1)* %149, align 4, !tbaa !11
  %150 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_counter, i32 0, i32 %148
  %151 = atomicrmw add i32 addrspace(3)* %150, i32 1 syncscope("agent-one-as") monotonic, align 4
  %152 = or i32 %85, 3
  %153 = zext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %36, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !5
  %156 = tail call float @llvm.fabs.f32(float %155)
  %157 = fcmp contract ogt float %156, %9
  %158 = fcmp contract olt float %156, %10
  %159 = and i1 %157, %158
  br i1 %159, label %163, label %160

160:                                              ; preds = %147
  %161 = fcmp contract ult float %156, %10
  %162 = select i1 %161, i32 %42, i32 0
  br label %169

163:                                              ; preds = %147
  %164 = fsub contract float %10, %156
  %165 = tail call float @llvm.fabs.f32(float %164)
  %166 = fmul contract float %165, %11
  %167 = tail call float @llvm.ceil.f32(float %166)
  %168 = fptosi float %167 to i32
  br label %169

169:                                              ; preds = %163, %160
  %170 = phi i32 [ %168, %163 ], [ %162, %160 ]
  %171 = getelementptr inbounds i32, i32 addrspace(1)* %37, i64 %153
  store i32 %170, i32 addrspace(1)* %171, align 4, !tbaa !11
  %172 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_counter, i32 0, i32 %170
  %173 = atomicrmw add i32 addrspace(3)* %172, i32 1 syncscope("agent-one-as") monotonic, align 4
  %174 = add nuw nsw i32 %85, 4
  %175 = add i32 %86, 4
  %176 = icmp eq i32 %175, %46
  br i1 %176, label %47, label %84, !llvm.loop !15

177:                                              ; preds = %177, %82
  %178 = phi i32 [ 0, %82 ], [ %219, %177 ]
  %179 = phi i32 [ 0, %82 ], [ %220, %177 ]
  %180 = zext i32 %178 to i64
  %181 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_counter, i32 0, i32 %178
  %182 = load i32, i32 addrspace(3)* %181, align 4, !tbaa !11
  %183 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %180
  store i32 %182, i32 addrspace(1)* %183, align 4, !tbaa !11
  %184 = or i32 %178, 1
  %185 = zext i32 %184 to i64
  %186 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_counter, i32 0, i32 %184
  %187 = load i32, i32 addrspace(3)* %186, align 4, !tbaa !11
  %188 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %185
  store i32 %187, i32 addrspace(1)* %188, align 4, !tbaa !11
  %189 = or i32 %178, 2
  %190 = zext i32 %189 to i64
  %191 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_counter, i32 0, i32 %189
  %192 = load i32, i32 addrspace(3)* %191, align 4, !tbaa !11
  %193 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %190
  store i32 %192, i32 addrspace(1)* %193, align 4, !tbaa !11
  %194 = or i32 %178, 3
  %195 = zext i32 %194 to i64
  %196 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_counter, i32 0, i32 %194
  %197 = load i32, i32 addrspace(3)* %196, align 4, !tbaa !11
  %198 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %195
  store i32 %197, i32 addrspace(1)* %198, align 4, !tbaa !11
  %199 = or i32 %178, 4
  %200 = zext i32 %199 to i64
  %201 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_counter, i32 0, i32 %199
  %202 = load i32, i32 addrspace(3)* %201, align 4, !tbaa !11
  %203 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %200
  store i32 %202, i32 addrspace(1)* %203, align 4, !tbaa !11
  %204 = or i32 %178, 5
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_counter, i32 0, i32 %204
  %207 = load i32, i32 addrspace(3)* %206, align 4, !tbaa !11
  %208 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %205
  store i32 %207, i32 addrspace(1)* %208, align 4, !tbaa !11
  %209 = or i32 %178, 6
  %210 = zext i32 %209 to i64
  %211 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_counter, i32 0, i32 %209
  %212 = load i32, i32 addrspace(3)* %211, align 4, !tbaa !11
  %213 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %210
  store i32 %212, i32 addrspace(1)* %213, align 4, !tbaa !11
  %214 = or i32 %178, 7
  %215 = zext i32 %214 to i64
  %216 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_counter, i32 0, i32 %214
  %217 = load i32, i32 addrspace(3)* %216, align 4, !tbaa !11
  %218 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %215
  store i32 %217, i32 addrspace(1)* %218, align 4, !tbaa !11
  %219 = add nuw nsw i32 %178, 8
  %220 = add i32 %179, 8
  %221 = icmp eq i32 %220, %83
  br i1 %221, label %222, label %177, !llvm.loop !17

222:                                              ; preds = %177, %79
  %223 = phi i32 [ 0, %79 ], [ %219, %177 ]
  %224 = icmp eq i32 %80, 0
  br i1 %224, label %235, label %225

225:                                              ; preds = %222, %225
  %226 = phi i32 [ %232, %225 ], [ %223, %222 ]
  %227 = phi i32 [ %233, %225 ], [ 0, %222 ]
  %228 = zext i32 %226 to i64
  %229 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s_counter, i32 0, i32 %226
  %230 = load i32, i32 addrspace(3)* %229, align 4, !tbaa !11
  %231 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %228
  store i32 %230, i32 addrspace(1)* %231, align 4, !tbaa !11
  %232 = add nuw nsw i32 %226, 1
  %233 = add i32 %227, 1
  %234 = icmp eq i32 %233, %80
  br i1 %234, label %235, label %225, !llvm.loop !18

235:                                              ; preds = %222, %225, %77
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
!18 = distinct !{!18, !14}
