; ModuleID = '../data/hip_kernels/4234/8/main.cu'
source_filename = "../data/hip_kernels/4234/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared_ = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19kernel_1024_one_256PfS_S_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = shl nuw nsw i32 %8, 8
  %10 = add nuw nsw i32 %9, %7
  %11 = shl nsw i32 %6, 12
  %12 = add i32 %10, %11
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %16 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %10
  store float %15, float addrspace(3)* %16, align 4, !tbaa !5
  %17 = add nuw nsw i32 %10, 1024
  %18 = add i32 %17, %11
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %17
  store float %21, float addrspace(3)* %22, align 4, !tbaa !5
  %23 = add nuw nsw i32 %10, 2048
  %24 = add i32 %23, %11
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !5, !amdgpu.noclobber !9
  %28 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %23
  store float %27, float addrspace(3)* %28, align 4, !tbaa !5
  %29 = add nuw nsw i32 %10, 3072
  %30 = add i32 %29, %11
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !5, !amdgpu.noclobber !9
  %34 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %29
  store float %33, float addrspace(3)* %34, align 4, !tbaa !5
  %35 = zext i32 %7 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !9
  %38 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 9216), i32 %7
  store float %37, float addrspace(3)* %38, align 4, !tbaa !5
  %39 = getelementptr inbounds float, float addrspace(1)* %3, i64 %35
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5, !amdgpu.noclobber !9
  %41 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 9472), i32 %7
  store float %40, float addrspace(3)* %41, align 4, !tbaa !5
  %42 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 8192), i32 %10
  store float 0.000000e+00, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = shl nuw nsw i32 %8, 10
  %44 = zext i32 %10 to i64
  %45 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %10
  %46 = zext i32 %17 to i64
  %47 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %17
  %48 = zext i32 %23 to i64
  %49 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %23
  %50 = zext i32 %29 to i64
  %51 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %29
  %52 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %7
  %53 = add nuw nsw i32 %43, 1
  %54 = add nuw nsw i32 %7, 256
  %55 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %54
  %56 = add nuw nsw i32 %43, 2
  %57 = add nuw nsw i32 %7, 512
  %58 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %57
  %59 = add nuw nsw i32 %43, 3
  %60 = add nuw nsw i32 %7, 768
  %61 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %60
  %62 = add nuw nsw i32 %43, 4
  %63 = or i32 %7, 1024
  %64 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %63
  %65 = add nuw nsw i32 %43, 5
  %66 = add nuw nsw i32 %7, 1280
  %67 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %66
  %68 = add nuw nsw i32 %43, 6
  %69 = add nuw nsw i32 %7, 1536
  %70 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %69
  %71 = add nuw nsw i32 %43, 7
  %72 = add nuw nsw i32 %7, 1792
  %73 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %72
  %74 = add nuw nsw i32 %43, 8
  %75 = or i32 %7, 2048
  %76 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %75
  %77 = add nuw nsw i32 %43, 9
  %78 = add nuw nsw i32 %7, 2304
  %79 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %78
  %80 = add nuw nsw i32 %43, 10
  %81 = add nuw nsw i32 %7, 2560
  %82 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %81
  %83 = add nuw nsw i32 %43, 11
  %84 = add nuw nsw i32 %7, 2816
  %85 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %84
  %86 = add nuw nsw i32 %43, 12
  %87 = or i32 %7, 3072
  %88 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %87
  %89 = add nuw nsw i32 %43, 13
  %90 = add nuw nsw i32 %7, 3328
  %91 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %90
  %92 = add nuw nsw i32 %43, 14
  %93 = add nuw nsw i32 %7, 3584
  %94 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %93
  %95 = add nuw nsw i32 %43, 15
  %96 = add nuw nsw i32 %7, 3840
  %97 = getelementptr inbounds float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 4096), i32 %96
  br label %111

98:                                               ; preds = %111
  %99 = zext i32 %10 to i64
  %100 = shl nsw i32 %6, 10
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %4, i64 %101
  %103 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %104 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %105 = fmul contract float %103, %104
  %106 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %107 = fadd contract float %105, %106
  %108 = fcmp contract ogt float %107, 0.000000e+00
  %109 = select contract i1 %108, float %107, float 0.000000e+00
  %110 = getelementptr inbounds float, float addrspace(1)* %102, i64 %99
  store float %109, float addrspace(1)* %110, align 4, !tbaa !5
  ret void

111:                                              ; preds = %5, %111
  %112 = phi i32 [ 0, %5 ], [ %206, %111 ]
  %113 = shl nuw nsw i32 %112, 8
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %1, i64 %114
  %116 = getelementptr inbounds float, float addrspace(1)* %115, i64 %44
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %117, float addrspace(3)* %45, align 4, !tbaa !5
  %118 = getelementptr inbounds float, float addrspace(1)* %115, i64 %46
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %119, float addrspace(3)* %47, align 4, !tbaa !5
  %120 = getelementptr inbounds float, float addrspace(1)* %115, i64 %48
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %121, float addrspace(3)* %49, align 4, !tbaa !5
  %122 = getelementptr inbounds float, float addrspace(1)* %115, i64 %50
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %123, float addrspace(3)* %51, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %124 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @shared_, i32 0, i32 %112
  %125 = getelementptr inbounds float, float addrspace(3)* %124, i32 %43
  %126 = load float, float addrspace(3)* %125, align 4, !tbaa !5
  %127 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %128 = fmul contract float %126, %127
  %129 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %130 = fadd contract float %129, %128
  store float %130, float addrspace(3)* %42, align 4, !tbaa !5
  %131 = getelementptr inbounds float, float addrspace(3)* %124, i32 %53
  %132 = load float, float addrspace(3)* %131, align 4, !tbaa !5
  %133 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %134 = fmul contract float %132, %133
  %135 = fadd contract float %130, %134
  store float %135, float addrspace(3)* %42, align 4, !tbaa !5
  %136 = getelementptr inbounds float, float addrspace(3)* %124, i32 %56
  %137 = load float, float addrspace(3)* %136, align 4, !tbaa !5
  %138 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %139 = fmul contract float %137, %138
  %140 = fadd contract float %135, %139
  store float %140, float addrspace(3)* %42, align 4, !tbaa !5
  %141 = getelementptr inbounds float, float addrspace(3)* %124, i32 %59
  %142 = load float, float addrspace(3)* %141, align 4, !tbaa !5
  %143 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %144 = fmul contract float %142, %143
  %145 = fadd contract float %140, %144
  store float %145, float addrspace(3)* %42, align 4, !tbaa !5
  %146 = getelementptr inbounds float, float addrspace(3)* %124, i32 %62
  %147 = load float, float addrspace(3)* %146, align 4, !tbaa !5
  %148 = load float, float addrspace(3)* %64, align 4, !tbaa !5
  %149 = fmul contract float %147, %148
  %150 = fadd contract float %145, %149
  store float %150, float addrspace(3)* %42, align 4, !tbaa !5
  %151 = getelementptr inbounds float, float addrspace(3)* %124, i32 %65
  %152 = load float, float addrspace(3)* %151, align 4, !tbaa !5
  %153 = load float, float addrspace(3)* %67, align 4, !tbaa !5
  %154 = fmul contract float %152, %153
  %155 = fadd contract float %150, %154
  store float %155, float addrspace(3)* %42, align 4, !tbaa !5
  %156 = getelementptr inbounds float, float addrspace(3)* %124, i32 %68
  %157 = load float, float addrspace(3)* %156, align 4, !tbaa !5
  %158 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %159 = fmul contract float %157, %158
  %160 = fadd contract float %155, %159
  store float %160, float addrspace(3)* %42, align 4, !tbaa !5
  %161 = getelementptr inbounds float, float addrspace(3)* %124, i32 %71
  %162 = load float, float addrspace(3)* %161, align 4, !tbaa !5
  %163 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %164 = fmul contract float %162, %163
  %165 = fadd contract float %160, %164
  store float %165, float addrspace(3)* %42, align 4, !tbaa !5
  %166 = getelementptr inbounds float, float addrspace(3)* %124, i32 %74
  %167 = load float, float addrspace(3)* %166, align 4, !tbaa !5
  %168 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %169 = fmul contract float %167, %168
  %170 = fadd contract float %165, %169
  store float %170, float addrspace(3)* %42, align 4, !tbaa !5
  %171 = getelementptr inbounds float, float addrspace(3)* %124, i32 %77
  %172 = load float, float addrspace(3)* %171, align 4, !tbaa !5
  %173 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %174 = fmul contract float %172, %173
  %175 = fadd contract float %170, %174
  store float %175, float addrspace(3)* %42, align 4, !tbaa !5
  %176 = getelementptr inbounds float, float addrspace(3)* %124, i32 %80
  %177 = load float, float addrspace(3)* %176, align 4, !tbaa !5
  %178 = load float, float addrspace(3)* %82, align 4, !tbaa !5
  %179 = fmul contract float %177, %178
  %180 = fadd contract float %175, %179
  store float %180, float addrspace(3)* %42, align 4, !tbaa !5
  %181 = getelementptr inbounds float, float addrspace(3)* %124, i32 %83
  %182 = load float, float addrspace(3)* %181, align 4, !tbaa !5
  %183 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %184 = fmul contract float %182, %183
  %185 = fadd contract float %180, %184
  store float %185, float addrspace(3)* %42, align 4, !tbaa !5
  %186 = getelementptr inbounds float, float addrspace(3)* %124, i32 %86
  %187 = load float, float addrspace(3)* %186, align 4, !tbaa !5
  %188 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %189 = fmul contract float %187, %188
  %190 = fadd contract float %185, %189
  store float %190, float addrspace(3)* %42, align 4, !tbaa !5
  %191 = getelementptr inbounds float, float addrspace(3)* %124, i32 %89
  %192 = load float, float addrspace(3)* %191, align 4, !tbaa !5
  %193 = load float, float addrspace(3)* %91, align 4, !tbaa !5
  %194 = fmul contract float %192, %193
  %195 = fadd contract float %190, %194
  store float %195, float addrspace(3)* %42, align 4, !tbaa !5
  %196 = getelementptr inbounds float, float addrspace(3)* %124, i32 %92
  %197 = load float, float addrspace(3)* %196, align 4, !tbaa !5
  %198 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %199 = fmul contract float %197, %198
  %200 = fadd contract float %195, %199
  store float %200, float addrspace(3)* %42, align 4, !tbaa !5
  %201 = getelementptr inbounds float, float addrspace(3)* %124, i32 %95
  %202 = load float, float addrspace(3)* %201, align 4, !tbaa !5
  %203 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %204 = fmul contract float %202, %203
  %205 = fadd contract float %200, %204
  store float %205, float addrspace(3)* %42, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %206 = add nuw nsw i32 %112, 16
  %207 = icmp ult i32 %112, 1008
  br i1 %207, label %111, label %98, !llvm.loop !10
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
