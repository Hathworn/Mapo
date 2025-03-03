; ModuleID = '../data/hip_kernels/5065/0/main.cu'
source_filename = "../data/hip_kernels/5065/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.point = type { float, float }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z2piPK5pointPiif(%struct.point addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, float %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = shl nuw nsw i32 %9, 5
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = sub i32 %2, %11
  %16 = icmp ult i32 %14, %15
  br i1 %16, label %17, label %244

17:                                               ; preds = %4, %17
  %18 = phi i32 [ %242, %17 ], [ 0, %4 ]
  %19 = mul nuw nsw i32 %18, %9
  %20 = add i32 %19, %14
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %21, i32 0
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = fmul contract float %23, %23
  %25 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %21, i32 1
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !12, !amdgpu.noclobber !5
  %27 = fmul contract float %26, %26
  %28 = fadd contract float %24, %27
  %29 = fcmp contract ole float %28, %3
  %30 = zext i1 %29 to i32
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %21
  store i32 %30, i32 addrspace(1)* %31, align 4, !tbaa !13
  %32 = or i32 %18, 1
  %33 = mul nuw nsw i32 %32, %9
  %34 = add i32 %33, %14
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %35, i32 0
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = fmul contract float %37, %37
  %39 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %35, i32 1
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !12, !amdgpu.noclobber !5
  %41 = fmul contract float %40, %40
  %42 = fadd contract float %38, %41
  %43 = fcmp contract ole float %42, %3
  %44 = zext i1 %43 to i32
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %35
  store i32 %44, i32 addrspace(1)* %45, align 4, !tbaa !13
  %46 = or i32 %18, 2
  %47 = mul nuw nsw i32 %46, %9
  %48 = add i32 %47, %14
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %49, i32 0
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = fmul contract float %51, %51
  %53 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %49, i32 1
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !12, !amdgpu.noclobber !5
  %55 = fmul contract float %54, %54
  %56 = fadd contract float %52, %55
  %57 = fcmp contract ole float %56, %3
  %58 = zext i1 %57 to i32
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %49
  store i32 %58, i32 addrspace(1)* %59, align 4, !tbaa !13
  %60 = or i32 %18, 3
  %61 = mul nuw nsw i32 %60, %9
  %62 = add i32 %61, %14
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %63, i32 0
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = fmul contract float %65, %65
  %67 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %63, i32 1
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !12, !amdgpu.noclobber !5
  %69 = fmul contract float %68, %68
  %70 = fadd contract float %66, %69
  %71 = fcmp contract ole float %70, %3
  %72 = zext i1 %71 to i32
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %63
  store i32 %72, i32 addrspace(1)* %73, align 4, !tbaa !13
  %74 = or i32 %18, 4
  %75 = mul nuw nsw i32 %74, %9
  %76 = add i32 %75, %14
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %77, i32 0
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = fmul contract float %79, %79
  %81 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %77, i32 1
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !12, !amdgpu.noclobber !5
  %83 = fmul contract float %82, %82
  %84 = fadd contract float %80, %83
  %85 = fcmp contract ole float %84, %3
  %86 = zext i1 %85 to i32
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %77
  store i32 %86, i32 addrspace(1)* %87, align 4, !tbaa !13
  %88 = or i32 %18, 5
  %89 = mul nuw nsw i32 %88, %9
  %90 = add i32 %89, %14
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %91, i32 0
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fmul contract float %93, %93
  %95 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %91, i32 1
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !12, !amdgpu.noclobber !5
  %97 = fmul contract float %96, %96
  %98 = fadd contract float %94, %97
  %99 = fcmp contract ole float %98, %3
  %100 = zext i1 %99 to i32
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %91
  store i32 %100, i32 addrspace(1)* %101, align 4, !tbaa !13
  %102 = or i32 %18, 6
  %103 = mul nuw nsw i32 %102, %9
  %104 = add i32 %103, %14
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %105, i32 0
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = fmul contract float %107, %107
  %109 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %105, i32 1
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !12, !amdgpu.noclobber !5
  %111 = fmul contract float %110, %110
  %112 = fadd contract float %108, %111
  %113 = fcmp contract ole float %112, %3
  %114 = zext i1 %113 to i32
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %105
  store i32 %114, i32 addrspace(1)* %115, align 4, !tbaa !13
  %116 = or i32 %18, 7
  %117 = mul nuw nsw i32 %116, %9
  %118 = add i32 %117, %14
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %119, i32 0
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = fmul contract float %121, %121
  %123 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %119, i32 1
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !12, !amdgpu.noclobber !5
  %125 = fmul contract float %124, %124
  %126 = fadd contract float %122, %125
  %127 = fcmp contract ole float %126, %3
  %128 = zext i1 %127 to i32
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %119
  store i32 %128, i32 addrspace(1)* %129, align 4, !tbaa !13
  %130 = or i32 %18, 8
  %131 = mul nuw nsw i32 %130, %9
  %132 = add i32 %131, %14
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %133, i32 0
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7, !amdgpu.noclobber !5
  %136 = fmul contract float %135, %135
  %137 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %133, i32 1
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !12, !amdgpu.noclobber !5
  %139 = fmul contract float %138, %138
  %140 = fadd contract float %136, %139
  %141 = fcmp contract ole float %140, %3
  %142 = zext i1 %141 to i32
  %143 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %133
  store i32 %142, i32 addrspace(1)* %143, align 4, !tbaa !13
  %144 = or i32 %18, 9
  %145 = mul nuw nsw i32 %144, %9
  %146 = add i32 %145, %14
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %147, i32 0
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !7, !amdgpu.noclobber !5
  %150 = fmul contract float %149, %149
  %151 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %147, i32 1
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !12, !amdgpu.noclobber !5
  %153 = fmul contract float %152, %152
  %154 = fadd contract float %150, %153
  %155 = fcmp contract ole float %154, %3
  %156 = zext i1 %155 to i32
  %157 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %147
  store i32 %156, i32 addrspace(1)* %157, align 4, !tbaa !13
  %158 = or i32 %18, 10
  %159 = mul nuw nsw i32 %158, %9
  %160 = add i32 %159, %14
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %161, i32 0
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7, !amdgpu.noclobber !5
  %164 = fmul contract float %163, %163
  %165 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %161, i32 1
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !12, !amdgpu.noclobber !5
  %167 = fmul contract float %166, %166
  %168 = fadd contract float %164, %167
  %169 = fcmp contract ole float %168, %3
  %170 = zext i1 %169 to i32
  %171 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %161
  store i32 %170, i32 addrspace(1)* %171, align 4, !tbaa !13
  %172 = or i32 %18, 11
  %173 = mul nuw nsw i32 %172, %9
  %174 = add i32 %173, %14
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %175, i32 0
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !7, !amdgpu.noclobber !5
  %178 = fmul contract float %177, %177
  %179 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %175, i32 1
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !12, !amdgpu.noclobber !5
  %181 = fmul contract float %180, %180
  %182 = fadd contract float %178, %181
  %183 = fcmp contract ole float %182, %3
  %184 = zext i1 %183 to i32
  %185 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %175
  store i32 %184, i32 addrspace(1)* %185, align 4, !tbaa !13
  %186 = or i32 %18, 12
  %187 = mul nuw nsw i32 %186, %9
  %188 = add i32 %187, %14
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %189, i32 0
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !7, !amdgpu.noclobber !5
  %192 = fmul contract float %191, %191
  %193 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %189, i32 1
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !12, !amdgpu.noclobber !5
  %195 = fmul contract float %194, %194
  %196 = fadd contract float %192, %195
  %197 = fcmp contract ole float %196, %3
  %198 = zext i1 %197 to i32
  %199 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %189
  store i32 %198, i32 addrspace(1)* %199, align 4, !tbaa !13
  %200 = or i32 %18, 13
  %201 = mul nuw nsw i32 %200, %9
  %202 = add i32 %201, %14
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %203, i32 0
  %205 = load float, float addrspace(1)* %204, align 4, !tbaa !7, !amdgpu.noclobber !5
  %206 = fmul contract float %205, %205
  %207 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %203, i32 1
  %208 = load float, float addrspace(1)* %207, align 4, !tbaa !12, !amdgpu.noclobber !5
  %209 = fmul contract float %208, %208
  %210 = fadd contract float %206, %209
  %211 = fcmp contract ole float %210, %3
  %212 = zext i1 %211 to i32
  %213 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %203
  store i32 %212, i32 addrspace(1)* %213, align 4, !tbaa !13
  %214 = or i32 %18, 14
  %215 = mul nuw nsw i32 %214, %9
  %216 = add i32 %215, %14
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %217, i32 0
  %219 = load float, float addrspace(1)* %218, align 4, !tbaa !7, !amdgpu.noclobber !5
  %220 = fmul contract float %219, %219
  %221 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %217, i32 1
  %222 = load float, float addrspace(1)* %221, align 4, !tbaa !12, !amdgpu.noclobber !5
  %223 = fmul contract float %222, %222
  %224 = fadd contract float %220, %223
  %225 = fcmp contract ole float %224, %3
  %226 = zext i1 %225 to i32
  %227 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %217
  store i32 %226, i32 addrspace(1)* %227, align 4, !tbaa !13
  %228 = or i32 %18, 15
  %229 = mul nuw nsw i32 %228, %9
  %230 = add i32 %229, %14
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %231, i32 0
  %233 = load float, float addrspace(1)* %232, align 4, !tbaa !7, !amdgpu.noclobber !5
  %234 = fmul contract float %233, %233
  %235 = getelementptr inbounds %struct.point, %struct.point addrspace(1)* %0, i64 %231, i32 1
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !12, !amdgpu.noclobber !5
  %237 = fmul contract float %236, %236
  %238 = fadd contract float %234, %237
  %239 = fcmp contract ole float %238, %3
  %240 = zext i1 %239 to i32
  %241 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %231
  store i32 %240, i32 addrspace(1)* %241, align 4, !tbaa !13
  %242 = add nuw nsw i32 %18, 16
  %243 = icmp eq i32 %242, 32
  br i1 %243, label %244, label %17, !llvm.loop !15

244:                                              ; preds = %17, %4
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
!7 = !{!8, !9, i64 0}
!8 = !{!"_ZTS5point", !9, i64 0, !9, i64 4}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = !{!8, !9, i64 4}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !10, i64 0}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{!"llvm.loop.unroll.disable"}
