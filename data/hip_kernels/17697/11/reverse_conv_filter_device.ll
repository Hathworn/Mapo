; ModuleID = '../data/hip_kernels/17697/11/main.cu'
source_filename = "../data/hip_kernels/17697/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19reverse_conv_filterPKffPfjj(float addrspace(1)* nocapture readonly %0, float %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp ult i32 %14, %4
  br i1 %15, label %16, label %250

16:                                               ; preds = %5
  %17 = fcmp contract oeq float %1, 0.000000e+00
  %18 = icmp eq i32 %3, 0
  br i1 %17, label %27, label %19

19:                                               ; preds = %16
  br i1 %18, label %250, label %20

20:                                               ; preds = %19
  %21 = mul i32 %14, %3
  %22 = add i32 %21, %3
  %23 = and i32 %3, 7
  %24 = icmp ult i32 %3, 8
  br i1 %24, label %230, label %25

25:                                               ; preds = %20
  %26 = and i32 %3, -8
  br label %112

27:                                               ; preds = %16
  br i1 %18, label %250, label %28

28:                                               ; preds = %27
  %29 = mul i32 %14, %3
  %30 = add i32 %29, %3
  %31 = and i32 %3, 7
  %32 = icmp ult i32 %3, 8
  br i1 %32, label %213, label %33

33:                                               ; preds = %28
  %34 = and i32 %3, -8
  br label %35

35:                                               ; preds = %35, %33
  %36 = phi i32 [ 0, %33 ], [ %109, %35 ]
  %37 = phi i32 [ 0, %33 ], [ %110, %35 ]
  %38 = xor i32 %36, -1
  %39 = add i32 %30, %38
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  %43 = add i32 %36, %29
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %2, i64 %44
  store float %42, float addrspace(1)* %45, align 4, !tbaa !7
  %46 = or i32 %36, 1
  %47 = sub nuw nsw i32 -2, %36
  %48 = add i32 %30, %47
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7
  %52 = add i32 %46, %29
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  store float %51, float addrspace(1)* %54, align 4, !tbaa !7
  %55 = or i32 %36, 2
  %56 = sub nuw nsw i32 -3, %36
  %57 = add i32 %30, %56
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = add i32 %55, %29
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  store float %60, float addrspace(1)* %63, align 4, !tbaa !7
  %64 = or i32 %36, 3
  %65 = sub nuw nsw i32 -4, %36
  %66 = add i32 %30, %65
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %70 = add i32 %64, %29
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %2, i64 %71
  store float %69, float addrspace(1)* %72, align 4, !tbaa !7
  %73 = or i32 %36, 4
  %74 = sub nuw nsw i32 -5, %36
  %75 = add i32 %30, %74
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7
  %79 = add i32 %73, %29
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  store float %78, float addrspace(1)* %81, align 4, !tbaa !7
  %82 = or i32 %36, 5
  %83 = sub nuw nsw i32 -6, %36
  %84 = add i32 %30, %83
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = add i32 %82, %29
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %89
  store float %87, float addrspace(1)* %90, align 4, !tbaa !7
  %91 = or i32 %36, 6
  %92 = sub nuw nsw i32 -7, %36
  %93 = add i32 %30, %92
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = add i32 %91, %29
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %2, i64 %98
  store float %96, float addrspace(1)* %99, align 4, !tbaa !7
  %100 = or i32 %36, 7
  %101 = sub nuw nsw i32 -8, %36
  %102 = add i32 %30, %101
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7
  %106 = add i32 %100, %29
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %2, i64 %107
  store float %105, float addrspace(1)* %108, align 4, !tbaa !7
  %109 = add nuw nsw i32 %36, 8
  %110 = add i32 %37, 8
  %111 = icmp eq i32 %110, %34
  br i1 %111, label %213, label %35, !llvm.loop !11

112:                                              ; preds = %112, %25
  %113 = phi i32 [ 0, %25 ], [ %210, %112 ]
  %114 = phi i32 [ 0, %25 ], [ %211, %112 ]
  %115 = xor i32 %113, -1
  %116 = add i32 %22, %115
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7
  %120 = add i32 %113, %21
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %2, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !7
  %124 = fmul contract float %123, %1
  %125 = fadd contract float %119, %124
  store float %125, float addrspace(1)* %122, align 4, !tbaa !7
  %126 = or i32 %113, 1
  %127 = sub nuw nsw i32 -2, %113
  %128 = add i32 %22, %127
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = add i32 %126, %21
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %2, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7
  %136 = fmul contract float %135, %1
  %137 = fadd contract float %131, %136
  store float %137, float addrspace(1)* %134, align 4, !tbaa !7
  %138 = or i32 %113, 2
  %139 = sub nuw nsw i32 -3, %113
  %140 = add i32 %22, %139
  %141 = zext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7
  %144 = add i32 %138, %21
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %2, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7
  %148 = fmul contract float %147, %1
  %149 = fadd contract float %143, %148
  store float %149, float addrspace(1)* %146, align 4, !tbaa !7
  %150 = or i32 %113, 3
  %151 = sub nuw nsw i32 -4, %113
  %152 = add i32 %22, %151
  %153 = zext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %0, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7
  %156 = add i32 %150, %21
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %2, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !7
  %160 = fmul contract float %159, %1
  %161 = fadd contract float %155, %160
  store float %161, float addrspace(1)* %158, align 4, !tbaa !7
  %162 = or i32 %113, 4
  %163 = sub nuw nsw i32 -5, %113
  %164 = add i32 %22, %163
  %165 = zext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %0, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7
  %168 = add i32 %162, %21
  %169 = zext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %2, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !7
  %172 = fmul contract float %171, %1
  %173 = fadd contract float %167, %172
  store float %173, float addrspace(1)* %170, align 4, !tbaa !7
  %174 = or i32 %113, 5
  %175 = sub nuw nsw i32 -6, %113
  %176 = add i32 %22, %175
  %177 = zext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %0, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !7
  %180 = add i32 %174, %21
  %181 = zext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %2, i64 %181
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !7
  %184 = fmul contract float %183, %1
  %185 = fadd contract float %179, %184
  store float %185, float addrspace(1)* %182, align 4, !tbaa !7
  %186 = or i32 %113, 6
  %187 = sub nuw nsw i32 -7, %113
  %188 = add i32 %22, %187
  %189 = zext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %0, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !7
  %192 = add i32 %186, %21
  %193 = zext i32 %192 to i64
  %194 = getelementptr inbounds float, float addrspace(1)* %2, i64 %193
  %195 = load float, float addrspace(1)* %194, align 4, !tbaa !7
  %196 = fmul contract float %195, %1
  %197 = fadd contract float %191, %196
  store float %197, float addrspace(1)* %194, align 4, !tbaa !7
  %198 = or i32 %113, 7
  %199 = sub nuw nsw i32 -8, %113
  %200 = add i32 %22, %199
  %201 = zext i32 %200 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %0, i64 %201
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !7
  %204 = add i32 %198, %21
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %2, i64 %205
  %207 = load float, float addrspace(1)* %206, align 4, !tbaa !7
  %208 = fmul contract float %207, %1
  %209 = fadd contract float %203, %208
  store float %209, float addrspace(1)* %206, align 4, !tbaa !7
  %210 = add nuw nsw i32 %113, 8
  %211 = add i32 %114, 8
  %212 = icmp eq i32 %211, %26
  br i1 %212, label %230, label %112, !llvm.loop !13

213:                                              ; preds = %35, %28
  %214 = phi i32 [ 0, %28 ], [ %109, %35 ]
  %215 = icmp eq i32 %31, 0
  br i1 %215, label %250, label %216

216:                                              ; preds = %213, %216
  %217 = phi i32 [ %227, %216 ], [ %214, %213 ]
  %218 = phi i32 [ %228, %216 ], [ 0, %213 ]
  %219 = xor i32 %217, -1
  %220 = add i32 %30, %219
  %221 = zext i32 %220 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %0, i64 %221
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !7
  %224 = add i32 %217, %29
  %225 = zext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(1)* %2, i64 %225
  store float %223, float addrspace(1)* %226, align 4, !tbaa !7
  %227 = add nuw nsw i32 %217, 1
  %228 = add i32 %218, 1
  %229 = icmp eq i32 %228, %31
  br i1 %229, label %250, label %216, !llvm.loop !14

230:                                              ; preds = %112, %20
  %231 = phi i32 [ 0, %20 ], [ %210, %112 ]
  %232 = icmp eq i32 %23, 0
  br i1 %232, label %250, label %233

233:                                              ; preds = %230, %233
  %234 = phi i32 [ %247, %233 ], [ %231, %230 ]
  %235 = phi i32 [ %248, %233 ], [ 0, %230 ]
  %236 = xor i32 %234, -1
  %237 = add i32 %22, %236
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds float, float addrspace(1)* %0, i64 %238
  %240 = load float, float addrspace(1)* %239, align 4, !tbaa !7
  %241 = add i32 %234, %21
  %242 = zext i32 %241 to i64
  %243 = getelementptr inbounds float, float addrspace(1)* %2, i64 %242
  %244 = load float, float addrspace(1)* %243, align 4, !tbaa !7
  %245 = fmul contract float %244, %1
  %246 = fadd contract float %240, %245
  store float %246, float addrspace(1)* %243, align 4, !tbaa !7
  %247 = add nuw nsw i32 %234, 1
  %248 = add i32 %235, 1
  %249 = icmp eq i32 %248, %23
  br i1 %249, label %250, label %233, !llvm.loop !16

250:                                              ; preds = %230, %233, %213, %216, %19, %27, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !15}
