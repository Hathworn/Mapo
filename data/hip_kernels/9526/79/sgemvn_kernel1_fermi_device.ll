; ModuleID = '../data/hip_kernels/9526/79/main.cu'
source_filename = "../data/hip_kernels/9526/79/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20sgemvn_kernel1_fermiiiifPfiS_S_(i32 %0, i32 %1, i32 %2, float %3, float addrspace(1)* nocapture readonly %4, i32 %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 7
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = add i32 %10, %11
  %13 = sext i32 %12 to i64
  %14 = icmp sgt i32 %2, 0
  br i1 %14, label %15, label %217

15:                                               ; preds = %8
  %16 = getelementptr inbounds float, float addrspace(1)* %4, i64 %13
  %17 = sext i32 %5 to i64
  br label %18

18:                                               ; preds = %15, %18
  %19 = phi i32 [ 0, %15 ], [ %215, %18 ]
  %20 = phi float [ 0.000000e+00, %15 ], [ %212, %18 ]
  %21 = phi float addrspace(1)* [ %16, %15 ], [ %213, %18 ]
  %22 = phi float addrspace(1)* [ %6, %15 ], [ %214, %18 ]
  %23 = load float, float addrspace(1)* %21, align 4, !tbaa !5
  %24 = load float, float addrspace(1)* %22, align 4, !tbaa !5
  %25 = fmul contract float %23, %24
  %26 = fadd contract float %20, %25
  %27 = getelementptr inbounds float, float addrspace(1)* %21, i64 %17
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !5
  %29 = getelementptr inbounds float, float addrspace(1)* %22, i64 1
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !5
  %31 = fmul contract float %28, %30
  %32 = fadd contract float %26, %31
  %33 = getelementptr inbounds float, float addrspace(1)* %27, i64 %17
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5
  %35 = getelementptr inbounds float, float addrspace(1)* %22, i64 2
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5
  %37 = fmul contract float %34, %36
  %38 = fadd contract float %32, %37
  %39 = getelementptr inbounds float, float addrspace(1)* %33, i64 %17
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5
  %41 = getelementptr inbounds float, float addrspace(1)* %22, i64 3
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5
  %43 = fmul contract float %40, %42
  %44 = fadd contract float %38, %43
  %45 = getelementptr inbounds float, float addrspace(1)* %39, i64 %17
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5
  %47 = getelementptr inbounds float, float addrspace(1)* %22, i64 4
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5
  %49 = fmul contract float %46, %48
  %50 = fadd contract float %44, %49
  %51 = getelementptr inbounds float, float addrspace(1)* %45, i64 %17
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5
  %53 = getelementptr inbounds float, float addrspace(1)* %22, i64 5
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5
  %55 = fmul contract float %52, %54
  %56 = fadd contract float %50, %55
  %57 = getelementptr inbounds float, float addrspace(1)* %51, i64 %17
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5
  %59 = getelementptr inbounds float, float addrspace(1)* %22, i64 6
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5
  %61 = fmul contract float %58, %60
  %62 = fadd contract float %56, %61
  %63 = getelementptr inbounds float, float addrspace(1)* %57, i64 %17
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !5
  %65 = getelementptr inbounds float, float addrspace(1)* %22, i64 7
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5
  %67 = fmul contract float %64, %66
  %68 = fadd contract float %62, %67
  %69 = getelementptr inbounds float, float addrspace(1)* %63, i64 %17
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5
  %71 = getelementptr inbounds float, float addrspace(1)* %22, i64 8
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5
  %73 = fmul contract float %70, %72
  %74 = fadd contract float %68, %73
  %75 = getelementptr inbounds float, float addrspace(1)* %69, i64 %17
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5
  %77 = getelementptr inbounds float, float addrspace(1)* %22, i64 9
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5
  %79 = fmul contract float %76, %78
  %80 = fadd contract float %74, %79
  %81 = getelementptr inbounds float, float addrspace(1)* %75, i64 %17
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5
  %83 = getelementptr inbounds float, float addrspace(1)* %22, i64 10
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !5
  %85 = fmul contract float %82, %84
  %86 = fadd contract float %80, %85
  %87 = getelementptr inbounds float, float addrspace(1)* %81, i64 %17
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5
  %89 = getelementptr inbounds float, float addrspace(1)* %22, i64 11
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !5
  %91 = fmul contract float %88, %90
  %92 = fadd contract float %86, %91
  %93 = getelementptr inbounds float, float addrspace(1)* %87, i64 %17
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5
  %95 = getelementptr inbounds float, float addrspace(1)* %22, i64 12
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !5
  %97 = fmul contract float %94, %96
  %98 = fadd contract float %92, %97
  %99 = getelementptr inbounds float, float addrspace(1)* %93, i64 %17
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !5
  %101 = getelementptr inbounds float, float addrspace(1)* %22, i64 13
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5
  %103 = fmul contract float %100, %102
  %104 = fadd contract float %98, %103
  %105 = getelementptr inbounds float, float addrspace(1)* %99, i64 %17
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5
  %107 = getelementptr inbounds float, float addrspace(1)* %22, i64 14
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !5
  %109 = fmul contract float %106, %108
  %110 = fadd contract float %104, %109
  %111 = getelementptr inbounds float, float addrspace(1)* %105, i64 %17
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !5
  %113 = getelementptr inbounds float, float addrspace(1)* %22, i64 15
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !5
  %115 = fmul contract float %112, %114
  %116 = fadd contract float %110, %115
  %117 = getelementptr inbounds float, float addrspace(1)* %111, i64 %17
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !5
  %119 = getelementptr inbounds float, float addrspace(1)* %22, i64 16
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !5
  %121 = fmul contract float %118, %120
  %122 = fadd contract float %116, %121
  %123 = getelementptr inbounds float, float addrspace(1)* %117, i64 %17
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !5
  %125 = getelementptr inbounds float, float addrspace(1)* %22, i64 17
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !5
  %127 = fmul contract float %124, %126
  %128 = fadd contract float %122, %127
  %129 = getelementptr inbounds float, float addrspace(1)* %123, i64 %17
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !5
  %131 = getelementptr inbounds float, float addrspace(1)* %22, i64 18
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !5
  %133 = fmul contract float %130, %132
  %134 = fadd contract float %128, %133
  %135 = getelementptr inbounds float, float addrspace(1)* %129, i64 %17
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !5
  %137 = getelementptr inbounds float, float addrspace(1)* %22, i64 19
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !5
  %139 = fmul contract float %136, %138
  %140 = fadd contract float %134, %139
  %141 = getelementptr inbounds float, float addrspace(1)* %135, i64 %17
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !5
  %143 = getelementptr inbounds float, float addrspace(1)* %22, i64 20
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !5
  %145 = fmul contract float %142, %144
  %146 = fadd contract float %140, %145
  %147 = getelementptr inbounds float, float addrspace(1)* %141, i64 %17
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !5
  %149 = getelementptr inbounds float, float addrspace(1)* %22, i64 21
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !5
  %151 = fmul contract float %148, %150
  %152 = fadd contract float %146, %151
  %153 = getelementptr inbounds float, float addrspace(1)* %147, i64 %17
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !5
  %155 = getelementptr inbounds float, float addrspace(1)* %22, i64 22
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !5
  %157 = fmul contract float %154, %156
  %158 = fadd contract float %152, %157
  %159 = getelementptr inbounds float, float addrspace(1)* %153, i64 %17
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !5
  %161 = getelementptr inbounds float, float addrspace(1)* %22, i64 23
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !5
  %163 = fmul contract float %160, %162
  %164 = fadd contract float %158, %163
  %165 = getelementptr inbounds float, float addrspace(1)* %159, i64 %17
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !5
  %167 = getelementptr inbounds float, float addrspace(1)* %22, i64 24
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !5
  %169 = fmul contract float %166, %168
  %170 = fadd contract float %164, %169
  %171 = getelementptr inbounds float, float addrspace(1)* %165, i64 %17
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !5
  %173 = getelementptr inbounds float, float addrspace(1)* %22, i64 25
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !5
  %175 = fmul contract float %172, %174
  %176 = fadd contract float %170, %175
  %177 = getelementptr inbounds float, float addrspace(1)* %171, i64 %17
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !5
  %179 = getelementptr inbounds float, float addrspace(1)* %22, i64 26
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !5
  %181 = fmul contract float %178, %180
  %182 = fadd contract float %176, %181
  %183 = getelementptr inbounds float, float addrspace(1)* %177, i64 %17
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !5
  %185 = getelementptr inbounds float, float addrspace(1)* %22, i64 27
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !5
  %187 = fmul contract float %184, %186
  %188 = fadd contract float %182, %187
  %189 = getelementptr inbounds float, float addrspace(1)* %183, i64 %17
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !5
  %191 = getelementptr inbounds float, float addrspace(1)* %22, i64 28
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !5
  %193 = fmul contract float %190, %192
  %194 = fadd contract float %188, %193
  %195 = getelementptr inbounds float, float addrspace(1)* %189, i64 %17
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !5
  %197 = getelementptr inbounds float, float addrspace(1)* %22, i64 29
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !5
  %199 = fmul contract float %196, %198
  %200 = fadd contract float %194, %199
  %201 = getelementptr inbounds float, float addrspace(1)* %195, i64 %17
  %202 = load float, float addrspace(1)* %201, align 4, !tbaa !5
  %203 = getelementptr inbounds float, float addrspace(1)* %22, i64 30
  %204 = load float, float addrspace(1)* %203, align 4, !tbaa !5
  %205 = fmul contract float %202, %204
  %206 = fadd contract float %200, %205
  %207 = getelementptr inbounds float, float addrspace(1)* %201, i64 %17
  %208 = load float, float addrspace(1)* %207, align 4, !tbaa !5
  %209 = getelementptr inbounds float, float addrspace(1)* %22, i64 31
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !5
  %211 = fmul contract float %208, %210
  %212 = fadd contract float %206, %211
  %213 = getelementptr inbounds float, float addrspace(1)* %207, i64 %17
  %214 = getelementptr inbounds float, float addrspace(1)* %22, i64 32
  %215 = add nuw nsw i32 %19, 32
  %216 = icmp slt i32 %215, %2
  br i1 %216, label %18, label %217, !llvm.loop !9

217:                                              ; preds = %18, %8
  %218 = phi float [ 0.000000e+00, %8 ], [ %212, %18 ]
  %219 = icmp slt i32 %12, %0
  br i1 %219, label %220, label %223

220:                                              ; preds = %217
  %221 = fmul contract float %218, %3
  %222 = getelementptr inbounds float, float addrspace(1)* %7, i64 %13
  store float %221, float addrspace(1)* %222, align 4, !tbaa !5
  br label %223

223:                                              ; preds = %220, %217
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
