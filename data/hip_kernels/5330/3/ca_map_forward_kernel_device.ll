; ModuleID = '../data/hip_kernels/5330/3/main.cu'
source_filename = "../data/hip_kernels/5330/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21ca_map_forward_kernelPKfS0_Pfiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = mul nsw i32 %6, %5
  %26 = add nsw i32 %5, -1
  %27 = add i32 %26, %6
  %28 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %29 = icmp slt i32 %16, %6
  %30 = icmp slt i32 %24, %5
  %31 = select i1 %29, i1 %30, i1 false
  %32 = icmp slt i32 %28, %4
  %33 = select i1 %31, i1 %32, i1 false
  %34 = icmp sgt i32 %3, 0
  %35 = select i1 %33, i1 %34, i1 false
  br i1 %35, label %36, label %224

36:                                               ; preds = %7
  %37 = icmp sgt i32 %6, 0
  %38 = mul nsw i32 %24, %6
  %39 = add i32 %38, %16
  %40 = icmp sgt i32 %5, 0
  %41 = and i32 %6, 3
  %42 = icmp ult i32 %6, 4
  %43 = and i32 %6, -4
  %44 = icmp eq i32 %41, 0
  %45 = and i32 %5, 1
  %46 = icmp eq i32 %5, 1
  %47 = and i32 %5, -2
  %48 = icmp eq i32 %45, 0
  br label %49

49:                                               ; preds = %36, %174
  %50 = phi i32 [ 0, %36 ], [ %175, %174 ]
  br i1 %37, label %51, label %83

51:                                               ; preds = %49
  %52 = mul nsw i32 %50, %4
  %53 = add nsw i32 %52, %28
  %54 = mul nsw i32 %53, %25
  %55 = add nsw i32 %54, %38
  %56 = mul nsw i32 %50, %27
  %57 = add nsw i32 %55, %16
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  br i1 %42, label %61, label %94

61:                                               ; preds = %94, %51
  %62 = phi float [ %60, %51 ], [ %148, %94 ]
  %63 = phi i32 [ 0, %51 ], [ %149, %94 ]
  br i1 %44, label %83, label %64

64:                                               ; preds = %61, %64
  %65 = phi float [ %79, %64 ], [ %62, %61 ]
  %66 = phi i32 [ %80, %64 ], [ %63, %61 ]
  %67 = phi i32 [ %81, %64 ], [ 0, %61 ]
  %68 = add nsw i32 %66, %55
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7
  %72 = add nsw i32 %66, %56
  %73 = mul nsw i32 %72, %25
  %74 = add i32 %39, %73
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7
  %78 = fmul contract float %71, %77
  %79 = fadd contract float %65, %78
  store float %79, float addrspace(1)* %59, align 4, !tbaa !7
  %80 = add nuw nsw i32 %66, 1
  %81 = add i32 %67, 1
  %82 = icmp eq i32 %81, %41
  br i1 %82, label %83, label %64, !llvm.loop !11

83:                                               ; preds = %61, %64, %49
  br i1 %40, label %84, label %174

84:                                               ; preds = %83
  %85 = mul nsw i32 %50, %4
  %86 = add nsw i32 %85, %28
  %87 = mul nsw i32 %86, %25
  %88 = add i32 %87, %16
  %89 = mul nsw i32 %50, %27
  %90 = add i32 %89, %6
  %91 = add i32 %39, %87
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %2, i64 %92
  br i1 %46, label %152, label %177

94:                                               ; preds = %51, %94
  %95 = phi float [ %148, %94 ], [ %60, %51 ]
  %96 = phi i32 [ %149, %94 ], [ 0, %51 ]
  %97 = phi i32 [ %150, %94 ], [ 0, %51 ]
  %98 = add nsw i32 %96, %55
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7
  %102 = add nsw i32 %96, %56
  %103 = mul nsw i32 %102, %25
  %104 = add i32 %39, %103
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7
  %108 = fmul contract float %101, %107
  %109 = fadd contract float %95, %108
  store float %109, float addrspace(1)* %59, align 4, !tbaa !7
  %110 = or i32 %96, 1
  %111 = add nsw i32 %110, %55
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %1, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7
  %115 = add nsw i32 %110, %56
  %116 = mul nsw i32 %115, %25
  %117 = add i32 %39, %116
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !7
  %121 = fmul contract float %114, %120
  %122 = fadd contract float %109, %121
  store float %122, float addrspace(1)* %59, align 4, !tbaa !7
  %123 = or i32 %96, 2
  %124 = add nsw i32 %123, %55
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %128 = add nsw i32 %123, %56
  %129 = mul nsw i32 %128, %25
  %130 = add i32 %39, %129
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7
  %134 = fmul contract float %127, %133
  %135 = fadd contract float %122, %134
  store float %135, float addrspace(1)* %59, align 4, !tbaa !7
  %136 = or i32 %96, 3
  %137 = add nsw i32 %136, %55
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %1, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7
  %141 = add nsw i32 %136, %56
  %142 = mul nsw i32 %141, %25
  %143 = add i32 %39, %142
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %0, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7
  %147 = fmul contract float %140, %146
  %148 = fadd contract float %135, %147
  store float %148, float addrspace(1)* %59, align 4, !tbaa !7
  %149 = add nuw nsw i32 %96, 4
  %150 = add i32 %97, 4
  %151 = icmp eq i32 %150, %43
  br i1 %151, label %61, label %94, !llvm.loop !13

152:                                              ; preds = %220, %84
  %153 = phi i32 [ 0, %84 ], [ %221, %220 ]
  %154 = icmp eq i32 %153, %24
  %155 = select i1 %48, i1 true, i1 %154
  br i1 %155, label %174, label %156

156:                                              ; preds = %152
  %157 = icmp sge i32 %153, %24
  %158 = sext i1 %157 to i32
  %159 = mul nsw i32 %153, %6
  %160 = add i32 %88, %159
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %1, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7
  %164 = add i32 %90, %153
  %165 = add i32 %164, %158
  %166 = mul nsw i32 %165, %25
  %167 = add i32 %39, %166
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %0, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !7
  %171 = fmul contract float %163, %170
  %172 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %173 = fadd contract float %172, %171
  store float %173, float addrspace(1)* %93, align 4, !tbaa !7
  br label %174

174:                                              ; preds = %152, %156, %83
  %175 = add nuw nsw i32 %50, 1
  %176 = icmp eq i32 %175, %3
  br i1 %176, label %224, label %49, !llvm.loop !15

177:                                              ; preds = %84, %220
  %178 = phi i32 [ %221, %220 ], [ 0, %84 ]
  %179 = phi i32 [ %222, %220 ], [ 0, %84 ]
  %180 = icmp eq i32 %178, %24
  br i1 %180, label %199, label %181

181:                                              ; preds = %177
  %182 = icmp sge i32 %178, %24
  %183 = sext i1 %182 to i32
  %184 = mul nsw i32 %178, %6
  %185 = add i32 %88, %184
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %1, i64 %186
  %188 = load float, float addrspace(1)* %187, align 4, !tbaa !7
  %189 = add i32 %90, %178
  %190 = add i32 %189, %183
  %191 = mul nsw i32 %190, %25
  %192 = add i32 %39, %191
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds float, float addrspace(1)* %0, i64 %193
  %195 = load float, float addrspace(1)* %194, align 4, !tbaa !7
  %196 = fmul contract float %188, %195
  %197 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %198 = fadd contract float %197, %196
  store float %198, float addrspace(1)* %93, align 4, !tbaa !7
  br label %199

199:                                              ; preds = %177, %181
  %200 = or i32 %178, 1
  %201 = icmp eq i32 %200, %24
  br i1 %201, label %220, label %202

202:                                              ; preds = %199
  %203 = icmp sge i32 %200, %24
  %204 = sext i1 %203 to i32
  %205 = mul nsw i32 %200, %6
  %206 = add i32 %88, %205
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %1, i64 %207
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !7
  %210 = add i32 %90, %200
  %211 = add i32 %210, %204
  %212 = mul nsw i32 %211, %25
  %213 = add i32 %39, %212
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds float, float addrspace(1)* %0, i64 %214
  %216 = load float, float addrspace(1)* %215, align 4, !tbaa !7
  %217 = fmul contract float %209, %216
  %218 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %219 = fadd contract float %218, %217
  store float %219, float addrspace(1)* %93, align 4, !tbaa !7
  br label %220

220:                                              ; preds = %202, %199
  %221 = add nuw nsw i32 %178, 2
  %222 = add i32 %179, 2
  %223 = icmp eq i32 %222, %47
  br i1 %223, label %152, label %177, !llvm.loop !16

224:                                              ; preds = %174, %7
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
