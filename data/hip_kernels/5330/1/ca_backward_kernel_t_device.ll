; ModuleID = '../data/hip_kernels/5330/1/main.cu'
source_filename = "../data/hip_kernels/5330/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20ca_backward_kernel_tPKfS0_S0_Pfiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readnone %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = mul nsw i32 %7, %6
  %27 = add nsw i32 %6, -1
  %28 = add i32 %27, %7
  %29 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %30 = icmp slt i32 %17, %7
  %31 = icmp slt i32 %25, %6
  %32 = select i1 %30, i1 %31, i1 false
  %33 = icmp slt i32 %29, %5
  %34 = select i1 %32, i1 %33, i1 false
  %35 = icmp sgt i32 %4, 0
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %225

37:                                               ; preds = %8
  %38 = icmp sgt i32 %7, 0
  %39 = mul nsw i32 %25, %7
  %40 = add i32 %39, %17
  %41 = icmp sgt i32 %6, 0
  %42 = and i32 %7, 3
  %43 = icmp ult i32 %7, 4
  %44 = and i32 %7, -4
  %45 = icmp eq i32 %42, 0
  %46 = and i32 %6, 1
  %47 = icmp eq i32 %6, 1
  %48 = and i32 %6, -2
  %49 = icmp eq i32 %46, 0
  br label %50

50:                                               ; preds = %37, %175
  %51 = phi i32 [ 0, %37 ], [ %176, %175 ]
  br i1 %38, label %52, label %84

52:                                               ; preds = %50
  %53 = mul nsw i32 %51, %28
  %54 = mul nsw i32 %51, %5
  %55 = add nsw i32 %54, %29
  %56 = mul nsw i32 %55, %26
  %57 = add nsw i32 %56, %39
  %58 = add nsw i32 %57, %17
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %3, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  br i1 %43, label %62, label %95

62:                                               ; preds = %95, %52
  %63 = phi float [ %61, %52 ], [ %149, %95 ]
  %64 = phi i32 [ 0, %52 ], [ %150, %95 ]
  br i1 %45, label %84, label %65

65:                                               ; preds = %62, %65
  %66 = phi float [ %80, %65 ], [ %63, %62 ]
  %67 = phi i32 [ %81, %65 ], [ %64, %62 ]
  %68 = phi i32 [ %82, %65 ], [ 0, %62 ]
  %69 = add nsw i32 %67, %53
  %70 = mul nsw i32 %69, %26
  %71 = add i32 %40, %70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = add nsw i32 %67, %57
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %2, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7
  %79 = fmul contract float %74, %78
  %80 = fadd contract float %66, %79
  store float %80, float addrspace(1)* %60, align 4, !tbaa !7
  %81 = add nuw nsw i32 %67, 1
  %82 = add i32 %68, 1
  %83 = icmp eq i32 %82, %42
  br i1 %83, label %84, label %65, !llvm.loop !11

84:                                               ; preds = %62, %65, %50
  br i1 %41, label %85, label %175

85:                                               ; preds = %84
  %86 = mul nsw i32 %51, %28
  %87 = add i32 %86, %7
  %88 = mul nsw i32 %51, %5
  %89 = add nsw i32 %88, %29
  %90 = mul nsw i32 %89, %26
  %91 = add i32 %90, %17
  %92 = add i32 %40, %90
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %3, i64 %93
  br i1 %47, label %153, label %178

95:                                               ; preds = %52, %95
  %96 = phi float [ %149, %95 ], [ %61, %52 ]
  %97 = phi i32 [ %150, %95 ], [ 0, %52 ]
  %98 = phi i32 [ %151, %95 ], [ 0, %52 ]
  %99 = add nsw i32 %97, %53
  %100 = mul nsw i32 %99, %26
  %101 = add i32 %40, %100
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7
  %105 = add nsw i32 %97, %57
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %2, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7
  %109 = fmul contract float %104, %108
  %110 = fadd contract float %96, %109
  store float %110, float addrspace(1)* %60, align 4, !tbaa !7
  %111 = or i32 %97, 1
  %112 = add nsw i32 %111, %53
  %113 = mul nsw i32 %112, %26
  %114 = add i32 %40, %113
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7
  %118 = add nsw i32 %111, %57
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %2, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7
  %122 = fmul contract float %117, %121
  %123 = fadd contract float %110, %122
  store float %123, float addrspace(1)* %60, align 4, !tbaa !7
  %124 = or i32 %97, 2
  %125 = add nsw i32 %124, %53
  %126 = mul nsw i32 %125, %26
  %127 = add i32 %40, %126
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7
  %131 = add nsw i32 %124, %57
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %2, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7
  %135 = fmul contract float %130, %134
  %136 = fadd contract float %123, %135
  store float %136, float addrspace(1)* %60, align 4, !tbaa !7
  %137 = or i32 %97, 3
  %138 = add nsw i32 %137, %53
  %139 = mul nsw i32 %138, %26
  %140 = add i32 %40, %139
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7
  %144 = add nsw i32 %137, %57
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %2, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7
  %148 = fmul contract float %143, %147
  %149 = fadd contract float %136, %148
  store float %149, float addrspace(1)* %60, align 4, !tbaa !7
  %150 = add nuw nsw i32 %97, 4
  %151 = add i32 %98, 4
  %152 = icmp eq i32 %151, %44
  br i1 %152, label %62, label %95, !llvm.loop !13

153:                                              ; preds = %221, %85
  %154 = phi i32 [ 0, %85 ], [ %222, %221 ]
  %155 = icmp eq i32 %154, %25
  %156 = select i1 %49, i1 true, i1 %155
  br i1 %156, label %175, label %157

157:                                              ; preds = %153
  %158 = icmp sge i32 %154, %25
  %159 = sext i1 %158 to i32
  %160 = add i32 %87, %154
  %161 = add i32 %160, %159
  %162 = mul nsw i32 %161, %26
  %163 = add i32 %40, %162
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %0, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !7
  %167 = mul nsw i32 %154, %7
  %168 = add i32 %91, %167
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %2, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !7
  %172 = fmul contract float %166, %171
  %173 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %174 = fadd contract float %173, %172
  store float %174, float addrspace(1)* %94, align 4, !tbaa !7
  br label %175

175:                                              ; preds = %153, %157, %84
  %176 = add nuw nsw i32 %51, 1
  %177 = icmp eq i32 %176, %4
  br i1 %177, label %225, label %50, !llvm.loop !15

178:                                              ; preds = %85, %221
  %179 = phi i32 [ %222, %221 ], [ 0, %85 ]
  %180 = phi i32 [ %223, %221 ], [ 0, %85 ]
  %181 = icmp eq i32 %179, %25
  br i1 %181, label %200, label %182

182:                                              ; preds = %178
  %183 = icmp sge i32 %179, %25
  %184 = sext i1 %183 to i32
  %185 = add i32 %87, %179
  %186 = add i32 %185, %184
  %187 = mul nsw i32 %186, %26
  %188 = add i32 %40, %187
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %0, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !7
  %192 = mul nsw i32 %179, %7
  %193 = add i32 %91, %192
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds float, float addrspace(1)* %2, i64 %194
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !7
  %197 = fmul contract float %191, %196
  %198 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %199 = fadd contract float %198, %197
  store float %199, float addrspace(1)* %94, align 4, !tbaa !7
  br label %200

200:                                              ; preds = %178, %182
  %201 = or i32 %179, 1
  %202 = icmp eq i32 %201, %25
  br i1 %202, label %221, label %203

203:                                              ; preds = %200
  %204 = icmp sge i32 %201, %25
  %205 = sext i1 %204 to i32
  %206 = add i32 %87, %201
  %207 = add i32 %206, %205
  %208 = mul nsw i32 %207, %26
  %209 = add i32 %40, %208
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds float, float addrspace(1)* %0, i64 %210
  %212 = load float, float addrspace(1)* %211, align 4, !tbaa !7
  %213 = mul nsw i32 %201, %7
  %214 = add i32 %91, %213
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %2, i64 %215
  %217 = load float, float addrspace(1)* %216, align 4, !tbaa !7
  %218 = fmul contract float %212, %217
  %219 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %220 = fadd contract float %219, %218
  store float %220, float addrspace(1)* %94, align 4, !tbaa !7
  br label %221

221:                                              ; preds = %203, %200
  %222 = add nuw nsw i32 %179, 2
  %223 = add i32 %180, 2
  %224 = icmp eq i32 %223, %48
  br i1 %224, label %153, label %178, !llvm.loop !16

225:                                              ; preds = %175, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
