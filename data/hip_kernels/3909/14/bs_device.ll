; ModuleID = '../data/hip_kernels/3909/14/main.cu'
source_filename = "../data/hip_kernels/3909/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z2bsPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %206

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = fmul contract float %18, 1.000000e+01
  %20 = fsub contract float 1.000000e+00, %18
  %21 = fmul contract float %20, 1.000000e+02
  %22 = fadd contract float %19, %21
  %23 = fmul contract float %20, 1.000000e+01
  %24 = fadd contract float %18, %23
  %25 = fmul contract float %18, 0x3F847AE140000000
  %26 = fmul contract float %20, 0x3FA99999A0000000
  %27 = fadd contract float %25, %26
  %28 = fmul contract float %20, 0x3FB99999A0000000
  %29 = fadd contract float %25, %28
  %30 = fcmp olt float %24, 0x39F0000000000000
  %31 = select i1 %30, float 0x41F0000000000000, float 1.000000e+00
  %32 = fmul float %24, %31
  %33 = tail call float @llvm.sqrt.f32(float %32)
  %34 = bitcast float %33 to i32
  %35 = add nsw i32 %34, -1
  %36 = bitcast i32 %35 to float
  %37 = add nsw i32 %34, 1
  %38 = bitcast i32 %37 to float
  %39 = tail call i1 @llvm.amdgcn.class.f32(float %32, i32 608)
  %40 = select i1 %30, float 0x3EF0000000000000, float 1.000000e+00
  %41 = fneg float %38
  %42 = tail call float @llvm.fma.f32(float %41, float %33, float %32)
  %43 = fcmp ogt float %42, 0.000000e+00
  %44 = fneg float %36
  %45 = tail call float @llvm.fma.f32(float %44, float %33, float %32)
  %46 = fcmp ole float %45, 0.000000e+00
  %47 = select i1 %46, float %36, float %33
  %48 = select i1 %43, float %38, float %47
  %49 = fmul float %40, %48
  %50 = select i1 %39, float %32, float %49
  %51 = fmul contract float %29, %50
  %52 = fdiv contract float %22, %22
  %53 = tail call i1 @llvm.amdgcn.class.f32(float %52, i32 144)
  %54 = select i1 %53, float 0x41F0000000000000, float 1.000000e+00
  %55 = fmul float %52, %54
  %56 = tail call float @llvm.log2.f32(float %55)
  %57 = fmul float %56, 0x3FE62E42E0000000
  %58 = tail call i1 @llvm.amdgcn.class.f32(float %56, i32 519)
  %59 = fneg float %57
  %60 = tail call float @llvm.fma.f32(float %56, float 0x3FE62E42E0000000, float %59)
  %61 = tail call float @llvm.fma.f32(float %56, float 0x3E6EFA39E0000000, float %60)
  %62 = fadd float %57, %61
  %63 = select i1 %58, float %56, float %62
  %64 = select i1 %53, float 0x40362E4300000000, float 0.000000e+00
  %65 = fsub float %63, %64
  %66 = fmul contract float %29, %29
  %67 = fmul contract float %66, 5.000000e-01
  %68 = fadd contract float %27, %67
  %69 = fmul contract float %24, %68
  %70 = fadd contract float %69, %65
  %71 = fdiv contract float %70, %51
  %72 = fsub contract float %71, %51
  %73 = fneg contract float %27
  %74 = fmul contract float %24, %73
  %75 = fmul float %74, 0x3FF7154760000000
  %76 = tail call float @llvm.rint.f32(float %75)
  %77 = fcmp ogt float %74, 0x40562E4300000000
  %78 = fcmp olt float %74, 0xC059D1DA00000000
  %79 = fneg float %75
  %80 = tail call float @llvm.fma.f32(float %74, float 0x3FF7154760000000, float %79)
  %81 = tail call float @llvm.fma.f32(float %74, float 0x3E54AE0BE0000000, float %80)
  %82 = fsub float %75, %76
  %83 = fadd float %81, %82
  %84 = tail call float @llvm.exp2.f32(float %83)
  %85 = fptosi float %76 to i32
  %86 = tail call float @llvm.amdgcn.ldexp.f32(float %84, i32 %85)
  %87 = select i1 %78, float 0.000000e+00, float %86
  %88 = select i1 %77, float 0x7FF0000000000000, float %87
  %89 = fmul contract float %22, %88
  %90 = tail call float @llvm.fabs.f32(float %71)
  %91 = fmul contract float %90, 0x3FCDA67120000000
  %92 = fadd contract float %91, 1.000000e+00
  %93 = fdiv contract float 1.000000e+00, %92
  %94 = fneg contract float %71
  %95 = fmul contract float %71, %94
  %96 = fmul contract float %95, 5.000000e-01
  %97 = fmul float %96, 0x3FF7154760000000
  %98 = tail call float @llvm.rint.f32(float %97)
  %99 = fcmp ogt float %96, 0x40562E4300000000
  %100 = fcmp olt float %96, 0xC059D1DA00000000
  %101 = fneg float %97
  %102 = tail call float @llvm.fma.f32(float %96, float 0x3FF7154760000000, float %101)
  %103 = tail call float @llvm.fma.f32(float %96, float 0x3E54AE0BE0000000, float %102)
  %104 = fsub float %97, %98
  %105 = fadd float %103, %104
  %106 = tail call float @llvm.exp2.f32(float %105)
  %107 = fptosi float %98 to i32
  %108 = tail call float @llvm.amdgcn.ldexp.f32(float %106, i32 %107)
  %109 = fmul contract float %108, 0x3FD9884540000000
  %110 = select i1 %100, float 0.000000e+00, float %109
  %111 = select i1 %99, float 0x7FF0000000000000, float %110
  %112 = fmul contract float %93, %111
  %113 = fmul contract float %93, 0x3FF548CDE0000000
  %114 = fadd contract float %113, 0xBFFD23DD40000000
  %115 = fmul contract float %93, %114
  %116 = fadd contract float %115, 0x3FFC80EF00000000
  %117 = fmul contract float %93, %116
  %118 = fadd contract float %117, 0xBFD6D1F0E0000000
  %119 = fmul contract float %93, %118
  %120 = fadd contract float %119, 0x3FD470BF40000000
  %121 = fmul contract float %112, %120
  %122 = fsub contract float 1.000000e+00, %121
  %123 = fcmp contract olt float %71, 0.000000e+00
  %124 = fsub contract float 1.000000e+00, %122
  %125 = select contract i1 %123, float %124, float %122
  %126 = tail call float @llvm.fabs.f32(float %72)
  %127 = fmul contract float %126, 0x3FCDA67120000000
  %128 = fadd contract float %127, 1.000000e+00
  %129 = fdiv contract float 1.000000e+00, %128
  %130 = fneg contract float %72
  %131 = fmul contract float %72, %130
  %132 = fmul contract float %131, 5.000000e-01
  %133 = fmul float %132, 0x3FF7154760000000
  %134 = tail call float @llvm.rint.f32(float %133)
  %135 = fcmp ogt float %132, 0x40562E4300000000
  %136 = fcmp olt float %132, 0xC059D1DA00000000
  %137 = fneg float %133
  %138 = tail call float @llvm.fma.f32(float %132, float 0x3FF7154760000000, float %137)
  %139 = tail call float @llvm.fma.f32(float %132, float 0x3E54AE0BE0000000, float %138)
  %140 = fsub float %133, %134
  %141 = fadd float %139, %140
  %142 = tail call float @llvm.exp2.f32(float %141)
  %143 = fptosi float %134 to i32
  %144 = tail call float @llvm.amdgcn.ldexp.f32(float %142, i32 %143)
  %145 = fmul contract float %144, 0x3FD9884540000000
  %146 = select i1 %136, float 0.000000e+00, float %145
  %147 = select i1 %135, float 0x7FF0000000000000, float %146
  %148 = fmul contract float %129, %147
  %149 = fmul contract float %129, 0x3FF548CDE0000000
  %150 = fadd contract float %149, 0xBFFD23DD40000000
  %151 = fmul contract float %129, %150
  %152 = fadd contract float %151, 0x3FFC80EF00000000
  %153 = fmul contract float %129, %152
  %154 = fadd contract float %153, 0xBFD6D1F0E0000000
  %155 = fmul contract float %129, %154
  %156 = fadd contract float %155, 0x3FD470BF40000000
  %157 = fmul contract float %148, %156
  %158 = fsub contract float 1.000000e+00, %157
  %159 = fcmp contract olt float %72, 0.000000e+00
  %160 = fsub contract float 1.000000e+00, %158
  %161 = select contract i1 %159, float %160, float %158
  %162 = fmul contract float %22, %125
  %163 = fmul contract float %89, %161
  %164 = fsub contract float %162, %163
  %165 = getelementptr inbounds float, float addrspace(1)* %2, i64 %16
  store float %164, float addrspace(1)* %165, align 4, !tbaa !7
  %166 = tail call float @llvm.fabs.f32(float %94)
  %167 = fmul contract float %166, 0x3FCDA67120000000
  %168 = fadd contract float %167, 1.000000e+00
  %169 = fdiv contract float 1.000000e+00, %168
  %170 = fmul contract float %169, %111
  %171 = fmul contract float %169, 0x3FF548CDE0000000
  %172 = fadd contract float %171, 0xBFFD23DD40000000
  %173 = fmul contract float %169, %172
  %174 = fadd contract float %173, 0x3FFC80EF00000000
  %175 = fmul contract float %169, %174
  %176 = fadd contract float %175, 0xBFD6D1F0E0000000
  %177 = fmul contract float %169, %176
  %178 = fadd contract float %177, 0x3FD470BF40000000
  %179 = fmul contract float %170, %178
  %180 = fsub contract float 1.000000e+00, %179
  %181 = fcmp contract ogt float %71, 0.000000e+00
  %182 = fsub contract float 1.000000e+00, %180
  %183 = select contract i1 %181, float %182, float %180
  %184 = tail call float @llvm.fabs.f32(float %130)
  %185 = fmul contract float %184, 0x3FCDA67120000000
  %186 = fadd contract float %185, 1.000000e+00
  %187 = fdiv contract float 1.000000e+00, %186
  %188 = fmul contract float %187, %147
  %189 = fmul contract float %187, 0x3FF548CDE0000000
  %190 = fadd contract float %189, 0xBFFD23DD40000000
  %191 = fmul contract float %187, %190
  %192 = fadd contract float %191, 0x3FFC80EF00000000
  %193 = fmul contract float %187, %192
  %194 = fadd contract float %193, 0xBFD6D1F0E0000000
  %195 = fmul contract float %187, %194
  %196 = fadd contract float %195, 0x3FD470BF40000000
  %197 = fmul contract float %188, %196
  %198 = fsub contract float 1.000000e+00, %197
  %199 = fcmp contract ogt float %72, 0.000000e+00
  %200 = fsub contract float 1.000000e+00, %198
  %201 = select contract i1 %199, float %200, float %198
  %202 = fmul contract float %89, %201
  %203 = fmul contract float %22, %183
  %204 = fsub contract float %202, %203
  %205 = getelementptr inbounds float, float addrspace(1)* %1, i64 %16
  store float %204, float addrspace(1)* %205, align 4, !tbaa !7
  br label %206

206:                                              ; preds = %15, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
