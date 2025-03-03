; ModuleID = '../data/hip_kernels/17214/0/main.cu'
source_filename = "../data/hip_kernels/17214/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z5SobelPKtPhjj(i16 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 3
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add nsw i32 %7, -2
  %9 = add i32 %8, %6
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = shl i32 %10, 3
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = add nsw i32 %12, -2
  %14 = add i32 %13, %11
  %15 = mul i32 %14, %2
  %16 = add i32 %15, %9
  %17 = mul nuw nsw i32 %12, 12
  %18 = add nuw nsw i32 %17, %7
  %19 = shl i32 %16, 2
  %20 = icmp ult i32 %9, %2
  %21 = icmp ult i32 %14, %3
  %22 = select i1 %20, i1 %21, i1 false
  br i1 %22, label %23, label %29

23:                                               ; preds = %4
  %24 = zext i32 %16 to i64
  %25 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %24
  %26 = load i16, i16 addrspace(1)* %25, align 2, !tbaa !5, !amdgpu.noclobber !9
  %27 = uitofp i16 %26 to float
  %28 = fdiv contract float %27, 6.553500e+04
  br label %29

29:                                               ; preds = %4, %23
  %30 = phi float [ %28, %23 ], [ 0.000000e+00, %4 ]
  %31 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %18
  store float %30, float addrspace(3)* %31, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = icmp ult i32 %8, 8
  %33 = icmp ult i32 %13, 8
  %34 = select i1 %32, i1 %33, i1 false
  br i1 %34, label %35, label %237

35:                                               ; preds = %29
  %36 = add nsw i32 %18, -24
  %37 = add nsw i32 %18, -26
  %38 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %37
  %39 = load float, float addrspace(3)* %38, align 4, !tbaa !10
  %40 = fneg contract float %39
  %41 = add nsw i32 %18, -25
  %42 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %41
  %43 = load float, float addrspace(3)* %42, align 4, !tbaa !10
  %44 = fmul contract float %43, 2.000000e+00
  %45 = fsub contract float %40, %44
  %46 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %36
  %47 = load float, float addrspace(3)* %46, align 4, !tbaa !10
  %48 = fmul contract float %47, 0.000000e+00
  %49 = fadd contract float %45, %48
  %50 = add nsw i32 %18, -23
  %51 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %50
  %52 = load float, float addrspace(3)* %51, align 4, !tbaa !10
  %53 = fmul contract float %52, 2.000000e+00
  %54 = fadd contract float %49, %53
  %55 = add nsw i32 %18, -22
  %56 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %55
  %57 = load float, float addrspace(3)* %56, align 4, !tbaa !10
  %58 = fadd contract float %57, %54
  %59 = add nsw i32 %18, -12
  %60 = add nsw i32 %18, -14
  %61 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %60
  %62 = load float, float addrspace(3)* %61, align 4, !tbaa !10
  %63 = fsub contract float %58, %62
  %64 = add nsw i32 %18, -13
  %65 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %64
  %66 = load float, float addrspace(3)* %65, align 4, !tbaa !10
  %67 = fmul contract float %66, 2.000000e+00
  %68 = fsub contract float %63, %67
  %69 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %59
  %70 = load float, float addrspace(3)* %69, align 4, !tbaa !10
  %71 = fmul contract float %70, 0.000000e+00
  %72 = fadd contract float %68, %71
  %73 = add nsw i32 %18, -11
  %74 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %73
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !10
  %76 = fmul contract float %75, 2.000000e+00
  %77 = fadd contract float %72, %76
  %78 = add nsw i32 %18, -10
  %79 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %78
  %80 = load float, float addrspace(3)* %79, align 4, !tbaa !10
  %81 = fadd contract float %80, %77
  %82 = add nsw i32 %18, -2
  %83 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %82
  %84 = load float, float addrspace(3)* %83, align 4, !tbaa !10
  %85 = fmul contract float %84, 2.000000e+00
  %86 = fsub contract float %81, %85
  %87 = add nsw i32 %18, -1
  %88 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %87
  %89 = load float, float addrspace(3)* %88, align 4, !tbaa !10
  %90 = fmul contract float %89, 4.000000e+00
  %91 = fsub contract float %86, %90
  %92 = load float, float addrspace(3)* %31, align 4, !tbaa !10
  %93 = fmul contract float %92, 0.000000e+00
  %94 = fadd contract float %91, %93
  %95 = add nuw nsw i32 %18, 1
  %96 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %95
  %97 = load float, float addrspace(3)* %96, align 4, !tbaa !10
  %98 = fmul contract float %97, 4.000000e+00
  %99 = fadd contract float %94, %98
  %100 = add nuw nsw i32 %18, 2
  %101 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %100
  %102 = load float, float addrspace(3)* %101, align 4, !tbaa !10
  %103 = fmul contract float %102, 2.000000e+00
  %104 = fadd contract float %99, %103
  %105 = add nuw nsw i32 %18, 12
  %106 = add nuw nsw i32 %18, 10
  %107 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %106
  %108 = load float, float addrspace(3)* %107, align 4, !tbaa !10
  %109 = fsub contract float %104, %108
  %110 = add nuw nsw i32 %18, 11
  %111 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %110
  %112 = load float, float addrspace(3)* %111, align 4, !tbaa !10
  %113 = fmul contract float %112, 2.000000e+00
  %114 = fsub contract float %109, %113
  %115 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %105
  %116 = load float, float addrspace(3)* %115, align 4, !tbaa !10
  %117 = fmul contract float %116, 0.000000e+00
  %118 = fadd contract float %114, %117
  %119 = add nuw nsw i32 %18, 13
  %120 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %119
  %121 = load float, float addrspace(3)* %120, align 4, !tbaa !10
  %122 = fmul contract float %121, 2.000000e+00
  %123 = fadd contract float %118, %122
  %124 = add nuw nsw i32 %18, 14
  %125 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %124
  %126 = load float, float addrspace(3)* %125, align 4, !tbaa !10
  %127 = fadd contract float %126, %123
  %128 = add nuw nsw i32 %18, 24
  %129 = add nuw nsw i32 %18, 22
  %130 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %129
  %131 = load float, float addrspace(3)* %130, align 4, !tbaa !10
  %132 = fsub contract float %127, %131
  %133 = add nuw nsw i32 %18, 23
  %134 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %133
  %135 = load float, float addrspace(3)* %134, align 4, !tbaa !10
  %136 = fmul contract float %135, 2.000000e+00
  %137 = fsub contract float %132, %136
  %138 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %128
  %139 = load float, float addrspace(3)* %138, align 4, !tbaa !10
  %140 = fmul contract float %139, 0.000000e+00
  %141 = fadd contract float %137, %140
  %142 = add nuw nsw i32 %18, 25
  %143 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %142
  %144 = load float, float addrspace(3)* %143, align 4, !tbaa !10
  %145 = fmul contract float %144, 2.000000e+00
  %146 = fadd contract float %141, %145
  %147 = add nuw nsw i32 %18, 26
  %148 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s, i32 0, i32 %147
  %149 = load float, float addrspace(3)* %148, align 4, !tbaa !10
  %150 = fadd contract float %149, %146
  %151 = fmul contract float %150, 6.400000e+01
  %152 = fdiv contract float %151, 1.800000e+01
  %153 = fadd contract float %39, %43
  %154 = fmul contract float %47, 2.000000e+00
  %155 = fadd contract float %153, %154
  %156 = fadd contract float %52, %155
  %157 = fadd contract float %57, %156
  %158 = fmul contract float %62, 2.000000e+00
  %159 = fadd contract float %157, %158
  %160 = fadd contract float %159, %67
  %161 = fmul contract float %70, 4.000000e+00
  %162 = fadd contract float %160, %161
  %163 = fadd contract float %162, %76
  %164 = fmul contract float %80, 2.000000e+00
  %165 = fadd contract float %163, %164
  %166 = fmul contract float %84, 0.000000e+00
  %167 = fadd contract float %165, %166
  %168 = fmul contract float %89, 0.000000e+00
  %169 = fadd contract float %167, %168
  %170 = fadd contract float %169, %93
  %171 = fmul contract float %97, 0.000000e+00
  %172 = fadd contract float %170, %171
  %173 = fmul contract float %102, 0.000000e+00
  %174 = fadd contract float %172, %173
  %175 = fmul contract float %108, 2.000000e+00
  %176 = fsub contract float %174, %175
  %177 = fsub contract float %176, %113
  %178 = fmul contract float %116, 4.000000e+00
  %179 = fsub contract float %177, %178
  %180 = fsub contract float %179, %122
  %181 = fmul contract float %126, 2.000000e+00
  %182 = fsub contract float %180, %181
  %183 = fsub contract float %182, %131
  %184 = fsub contract float %183, %135
  %185 = fmul contract float %139, 2.000000e+00
  %186 = fsub contract float %184, %185
  %187 = fsub contract float %186, %144
  %188 = fsub contract float %187, %149
  %189 = fmul contract float %188, 6.400000e+01
  %190 = fdiv contract float %189, 1.800000e+01
  %191 = fmul contract float %152, %152
  %192 = fmul contract float %190, %190
  %193 = fadd contract float %191, %192
  %194 = fadd contract float %193, 1.000000e+00
  %195 = fcmp olt float %194, 0x39F0000000000000
  %196 = select i1 %195, float 0x41F0000000000000, float 1.000000e+00
  %197 = fmul float %194, %196
  %198 = tail call float @llvm.sqrt.f32(float %197)
  %199 = bitcast float %198 to i32
  %200 = add nsw i32 %199, -1
  %201 = bitcast i32 %200 to float
  %202 = add nsw i32 %199, 1
  %203 = bitcast i32 %202 to float
  %204 = tail call i1 @llvm.amdgcn.class.f32(float %197, i32 608)
  %205 = select i1 %195, float 0x3EF0000000000000, float 1.000000e+00
  %206 = fneg float %203
  %207 = tail call float @llvm.fma.f32(float %206, float %198, float %197)
  %208 = fcmp ogt float %207, 0.000000e+00
  %209 = fneg float %201
  %210 = tail call float @llvm.fma.f32(float %209, float %198, float %197)
  %211 = fcmp ole float %210, 0.000000e+00
  %212 = select i1 %211, float %201, float %198
  %213 = select i1 %208, float %203, float %212
  %214 = fmul float %205, %213
  %215 = select i1 %204, float %197, float %214
  %216 = fmul contract float %152, 1.280000e+02
  %217 = fdiv contract float %216, %215
  %218 = fsub contract float 1.280000e+02, %217
  %219 = fptoui float %218 to i8
  %220 = fmul contract float %190, 1.280000e+02
  %221 = fdiv contract float %220, %215
  %222 = fsub contract float 1.280000e+02, %221
  %223 = fptoui float %222 to i8
  %224 = fdiv contract float 2.550000e+02, %215
  %225 = fptoui float %224 to i8
  %226 = add nuw nsw i32 %19, 1
  %227 = zext i32 %19 to i64
  %228 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %227
  store i8 %219, i8 addrspace(1)* %228, align 1, !tbaa !12
  %229 = add nuw nsw i32 %19, 2
  %230 = zext i32 %226 to i64
  %231 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %230
  store i8 %223, i8 addrspace(1)* %231, align 1, !tbaa !12
  %232 = add nuw nsw i32 %19, 3
  %233 = zext i32 %229 to i64
  %234 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %233
  store i8 %225, i8 addrspace(1)* %234, align 1, !tbaa !12
  %235 = zext i32 %232 to i64
  %236 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %235
  store i8 -1, i8 addrspace(1)* %236, align 1, !tbaa !12
  br label %237

237:                                              ; preds = %35, %29
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
!12 = !{!7, !7, i64 0}
