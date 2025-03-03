; ModuleID = '../data/hip_kernels/15063/6/main.cu'
source_filename = "../data/hip_kernels/15063/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9ApplyMat5PfS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = mul nsw i32 %12, 300
  %14 = getelementptr inbounds float, float addrspace(1)* %2, i64 1
  %15 = getelementptr inbounds float, float addrspace(1)* %2, i64 2
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 3
  %17 = getelementptr inbounds float, float addrspace(1)* %2, i64 4
  %18 = getelementptr inbounds float, float addrspace(1)* %2, i64 5
  %19 = getelementptr inbounds float, float addrspace(1)* %2, i64 6
  %20 = getelementptr inbounds float, float addrspace(1)* %2, i64 7
  %21 = getelementptr inbounds float, float addrspace(1)* %2, i64 8
  %22 = getelementptr inbounds float, float addrspace(1)* %2, i64 9
  %23 = getelementptr inbounds float, float addrspace(1)* %2, i64 10
  %24 = getelementptr inbounds float, float addrspace(1)* %2, i64 11
  %25 = getelementptr inbounds float, float addrspace(1)* %2, i64 12
  %26 = getelementptr inbounds float, float addrspace(1)* %2, i64 13
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 14
  %28 = getelementptr inbounds float, float addrspace(1)* %2, i64 15
  %29 = getelementptr inbounds float, float addrspace(1)* %2, i64 16
  %30 = getelementptr inbounds float, float addrspace(1)* %2, i64 17
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 18
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 19
  %33 = getelementptr inbounds float, float addrspace(1)* %2, i64 20
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 21
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 22
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 23
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 24
  %38 = mul nsw i32 %12, 296
  br label %40

39:                                               ; preds = %40
  ret void

40:                                               ; preds = %3, %40
  %41 = phi i32 [ 0, %3 ], [ %221, %40 ]
  %42 = add nsw i32 %41, %13
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %46 = load float, float addrspace(1)* %2, align 4, !tbaa !7
  %47 = fmul contract float %45, %46
  %48 = fadd contract float %47, 0.000000e+00
  %49 = add nsw i32 %42, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = load float, float addrspace(1)* %14, align 4, !tbaa !7
  %54 = fmul contract float %52, %53
  %55 = fadd contract float %48, %54
  %56 = add nsw i32 %42, 2
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = load float, float addrspace(1)* %15, align 4, !tbaa !7
  %61 = fmul contract float %59, %60
  %62 = fadd contract float %55, %61
  %63 = add nsw i32 %42, 3
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = load float, float addrspace(1)* %16, align 4, !tbaa !7
  %68 = fmul contract float %66, %67
  %69 = fadd contract float %62, %68
  %70 = add nsw i32 %42, 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7
  %74 = load float, float addrspace(1)* %17, align 4, !tbaa !7
  %75 = fmul contract float %73, %74
  %76 = fadd contract float %69, %75
  %77 = add nsw i32 %42, 300
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %82 = fmul contract float %80, %81
  %83 = fadd contract float %76, %82
  %84 = add nsw i32 %42, 301
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = load float, float addrspace(1)* %19, align 4, !tbaa !7
  %89 = fmul contract float %87, %88
  %90 = fadd contract float %83, %89
  %91 = add nsw i32 %42, 302
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %95 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %96 = fmul contract float %94, %95
  %97 = fadd contract float %90, %96
  %98 = add nsw i32 %42, 303
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7
  %102 = load float, float addrspace(1)* %21, align 4, !tbaa !7
  %103 = fmul contract float %101, %102
  %104 = fadd contract float %97, %103
  %105 = add nsw i32 %42, 304
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7
  %109 = load float, float addrspace(1)* %22, align 4, !tbaa !7
  %110 = fmul contract float %108, %109
  %111 = fadd contract float %104, %110
  %112 = add nsw i32 %42, 600
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7
  %116 = load float, float addrspace(1)* %23, align 4, !tbaa !7
  %117 = fmul contract float %115, %116
  %118 = fadd contract float %111, %117
  %119 = add nsw i32 %42, 601
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = load float, float addrspace(1)* %24, align 4, !tbaa !7
  %124 = fmul contract float %122, %123
  %125 = fadd contract float %118, %124
  %126 = add nsw i32 %42, 602
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7
  %130 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %131 = fmul contract float %129, %130
  %132 = fadd contract float %125, %131
  %133 = add nsw i32 %42, 603
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7
  %137 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %138 = fmul contract float %136, %137
  %139 = fadd contract float %132, %138
  %140 = add nsw i32 %42, 604
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7
  %144 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %145 = fmul contract float %143, %144
  %146 = fadd contract float %139, %145
  %147 = add nsw i32 %42, 900
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7
  %151 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %152 = fmul contract float %150, %151
  %153 = fadd contract float %146, %152
  %154 = add nsw i32 %42, 901
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %0, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !7
  %158 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %159 = fmul contract float %157, %158
  %160 = fadd contract float %153, %159
  %161 = add nsw i32 %42, 902
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !7
  %165 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %166 = fmul contract float %164, %165
  %167 = fadd contract float %160, %166
  %168 = add nsw i32 %42, 903
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %0, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !7
  %172 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %173 = fmul contract float %171, %172
  %174 = fadd contract float %167, %173
  %175 = add nsw i32 %42, 904
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %0, i64 %176
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !7
  %179 = load float, float addrspace(1)* %32, align 4, !tbaa !7
  %180 = fmul contract float %178, %179
  %181 = fadd contract float %174, %180
  %182 = add nsw i32 %42, 1200
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %0, i64 %183
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !7
  %186 = load float, float addrspace(1)* %33, align 4, !tbaa !7
  %187 = fmul contract float %185, %186
  %188 = fadd contract float %181, %187
  %189 = add nsw i32 %42, 1201
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %0, i64 %190
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !7
  %193 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %194 = fmul contract float %192, %193
  %195 = fadd contract float %188, %194
  %196 = add nsw i32 %42, 1202
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %0, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !7
  %200 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  %201 = fmul contract float %199, %200
  %202 = fadd contract float %195, %201
  %203 = add nsw i32 %42, 1203
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %0, i64 %204
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !7
  %207 = load float, float addrspace(1)* %36, align 4, !tbaa !7
  %208 = fmul contract float %206, %207
  %209 = fadd contract float %202, %208
  %210 = add nsw i32 %42, 1204
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds float, float addrspace(1)* %0, i64 %211
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !7
  %214 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  %215 = fmul contract float %213, %214
  %216 = fadd contract float %209, %215
  %217 = tail call float @llvm.maxnum.f32(float %216, float 0.000000e+00)
  %218 = add nsw i32 %41, %38
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %1, i64 %219
  store float %217, float addrspace(1)* %220, align 4, !tbaa !7
  %221 = add nuw nsw i32 %41, 1
  %222 = icmp eq i32 %221, 296
  br i1 %222, label %39, label %40, !llvm.loop !11
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
