; ModuleID = '../data/hip_kernels/8577/0/main.cu'
source_filename = "../data/hip_kernels/8577/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8kernel_APfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add i32 %11, %12
  %14 = mul nsw i32 %13, %1
  %15 = add nsw i32 %14, %4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = and i32 %4, 1
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %57, label %21

21:                                               ; preds = %3
  %22 = tail call i1 @llvm.amdgcn.class.f32(float %18, i32 144)
  %23 = select i1 %22, float 0x41F0000000000000, float 1.000000e+00
  %24 = fmul float %18, %23
  %25 = tail call float @llvm.log2.f32(float %24)
  %26 = fmul float %25, 0x3FE62E42E0000000
  %27 = tail call i1 @llvm.amdgcn.class.f32(float %25, i32 519)
  %28 = fneg float %26
  %29 = tail call float @llvm.fma.f32(float %25, float 0x3FE62E42E0000000, float %28)
  %30 = tail call float @llvm.fma.f32(float %25, float 0x3E6EFA39E0000000, float %29)
  %31 = fadd float %26, %30
  %32 = select i1 %27, float %25, float %31
  %33 = select i1 %22, float 0x40362E4300000000, float 0.000000e+00
  %34 = fsub float %32, %33
  %35 = fadd contract float %34, 1.000000e+00
  %36 = fcmp olt float %35, 0x39F0000000000000
  %37 = select i1 %36, float 0x41F0000000000000, float 1.000000e+00
  %38 = fmul float %35, %37
  %39 = tail call float @llvm.sqrt.f32(float %38)
  %40 = bitcast float %39 to i32
  %41 = add nsw i32 %40, -1
  %42 = bitcast i32 %41 to float
  %43 = add nsw i32 %40, 1
  %44 = bitcast i32 %43 to float
  %45 = tail call i1 @llvm.amdgcn.class.f32(float %38, i32 608)
  %46 = select i1 %36, float 0x3EF0000000000000, float 1.000000e+00
  %47 = fneg float %44
  %48 = tail call float @llvm.fma.f32(float %47, float %39, float %38)
  %49 = fcmp ogt float %48, 0.000000e+00
  %50 = fneg float %42
  %51 = tail call float @llvm.fma.f32(float %50, float %39, float %38)
  %52 = fcmp ole float %51, 0.000000e+00
  %53 = select i1 %52, float %42, float %39
  %54 = select i1 %49, float %44, float %53
  %55 = fmul float %46, %54
  %56 = select i1 %45, float %38, float %55
  br label %218

57:                                               ; preds = %3
  %58 = tail call float @llvm.fabs.f32(float %18)
  %59 = fcmp olt float %58, 1.310720e+05
  br i1 %59, label %60, label %67

60:                                               ; preds = %57
  %61 = fmul float %58, 0x3FE45F3060000000
  %62 = tail call float @llvm.rint.f32(float %61)
  %63 = tail call float @llvm.fma.f32(float %62, float 0xBFF921FB40000000, float %58)
  %64 = tail call float @llvm.fma.f32(float %62, float 0xBE74442D00000000, float %63)
  %65 = tail call float @llvm.fma.f32(float %62, float 0xBCF8469880000000, float %64)
  %66 = fptosi float %62 to i32
  br label %173

67:                                               ; preds = %57
  %68 = bitcast float %58 to i32
  %69 = lshr i32 %68, 23
  %70 = and i32 %68, 8388607
  %71 = or i32 %70, 8388608
  %72 = zext i32 %71 to i64
  %73 = mul nuw nsw i64 %72, 4266746795
  %74 = trunc i64 %73 to i32
  %75 = lshr i64 %73, 32
  %76 = mul nuw nsw i64 %72, 1011060801
  %77 = add nuw nsw i64 %75, %76
  %78 = trunc i64 %77 to i32
  %79 = lshr i64 %77, 32
  %80 = mul nuw nsw i64 %72, 3680671129
  %81 = add nuw nsw i64 %79, %80
  %82 = trunc i64 %81 to i32
  %83 = lshr i64 %81, 32
  %84 = mul nuw nsw i64 %72, 4113882560
  %85 = add nuw nsw i64 %83, %84
  %86 = trunc i64 %85 to i32
  %87 = lshr i64 %85, 32
  %88 = mul nuw nsw i64 %72, 4230436817
  %89 = add nuw nsw i64 %87, %88
  %90 = trunc i64 %89 to i32
  %91 = lshr i64 %89, 32
  %92 = mul nuw nsw i64 %72, 1313084713
  %93 = add nuw nsw i64 %91, %92
  %94 = trunc i64 %93 to i32
  %95 = lshr i64 %93, 32
  %96 = mul nuw nsw i64 %72, 2734261102
  %97 = add nuw nsw i64 %95, %96
  %98 = trunc i64 %97 to i32
  %99 = lshr i64 %97, 32
  %100 = trunc i64 %99 to i32
  %101 = add nsw i32 %69, -120
  %102 = icmp ugt i32 %101, 63
  %103 = select i1 %102, i32 %94, i32 %100
  %104 = select i1 %102, i32 %90, i32 %98
  %105 = select i1 %102, i32 %86, i32 %94
  %106 = select i1 %102, i32 %82, i32 %90
  %107 = select i1 %102, i32 %78, i32 %86
  %108 = select i1 %102, i32 %74, i32 %82
  %109 = select i1 %102, i32 -64, i32 0
  %110 = add nsw i32 %109, %101
  %111 = icmp ugt i32 %110, 31
  %112 = select i1 %111, i32 %104, i32 %103
  %113 = select i1 %111, i32 %105, i32 %104
  %114 = select i1 %111, i32 %106, i32 %105
  %115 = select i1 %111, i32 %107, i32 %106
  %116 = select i1 %111, i32 %108, i32 %107
  %117 = select i1 %111, i32 -32, i32 0
  %118 = add nsw i32 %117, %110
  %119 = icmp ugt i32 %118, 31
  %120 = select i1 %119, i32 %113, i32 %112
  %121 = select i1 %119, i32 %114, i32 %113
  %122 = select i1 %119, i32 %115, i32 %114
  %123 = select i1 %119, i32 %116, i32 %115
  %124 = select i1 %119, i32 -32, i32 0
  %125 = add nsw i32 %124, %118
  %126 = icmp eq i32 %125, 0
  %127 = sub nsw i32 32, %125
  %128 = tail call i32 @llvm.fshr.i32(i32 %120, i32 %121, i32 %127)
  %129 = tail call i32 @llvm.fshr.i32(i32 %121, i32 %122, i32 %127)
  %130 = tail call i32 @llvm.fshr.i32(i32 %122, i32 %123, i32 %127)
  %131 = select i1 %126, i32 %120, i32 %128
  %132 = select i1 %126, i32 %121, i32 %129
  %133 = select i1 %126, i32 %122, i32 %130
  %134 = lshr i32 %131, 29
  %135 = tail call i32 @llvm.fshl.i32(i32 %131, i32 %132, i32 2)
  %136 = tail call i32 @llvm.fshl.i32(i32 %132, i32 %133, i32 2)
  %137 = tail call i32 @llvm.fshl.i32(i32 %133, i32 %123, i32 2)
  %138 = and i32 %134, 1
  %139 = sub nsw i32 0, %138
  %140 = shl i32 %134, 31
  %141 = xor i32 %135, %139
  %142 = xor i32 %136, %139
  %143 = xor i32 %137, %139
  %144 = tail call i32 @llvm.ctlz.i32(i32 %141, i1 false), !range !11
  %145 = sub nsw i32 31, %144
  %146 = tail call i32 @llvm.fshr.i32(i32 %141, i32 %142, i32 %145)
  %147 = tail call i32 @llvm.fshr.i32(i32 %142, i32 %143, i32 %145)
  %148 = shl nuw nsw i32 %144, 23
  %149 = sub nuw nsw i32 1056964608, %148
  %150 = lshr i32 %146, 9
  %151 = or i32 %150, %149
  %152 = or i32 %151, %140
  %153 = bitcast i32 %152 to float
  %154 = tail call i32 @llvm.fshl.i32(i32 %146, i32 %147, i32 23)
  %155 = tail call i32 @llvm.ctlz.i32(i32 %154, i1 false), !range !11
  %156 = fmul float %153, 0x3FF921FB40000000
  %157 = add nuw nsw i32 %155, %144
  %158 = shl nuw nsw i32 %157, 23
  %159 = sub nuw nsw i32 855638016, %158
  %160 = sub nsw i32 31, %155
  %161 = tail call i32 @llvm.fshr.i32(i32 %154, i32 %147, i32 %160)
  %162 = lshr i32 %161, 9
  %163 = or i32 %159, %162
  %164 = or i32 %163, %140
  %165 = bitcast i32 %164 to float
  %166 = fneg float %156
  %167 = tail call float @llvm.fma.f32(float %153, float 0x3FF921FB40000000, float %166)
  %168 = tail call float @llvm.fma.f32(float %153, float 0x3E74442D00000000, float %167)
  %169 = tail call float @llvm.fma.f32(float %165, float 0x3FF921FB40000000, float %168)
  %170 = fadd float %156, %169
  %171 = lshr i32 %131, 30
  %172 = add nuw nsw i32 %138, %171
  br label %173

173:                                              ; preds = %60, %67
  %174 = phi float [ %65, %60 ], [ %170, %67 ]
  %175 = phi i32 [ %66, %60 ], [ %172, %67 ]
  %176 = fmul float %174, %174
  %177 = tail call float @llvm.fmuladd.f32(float %176, float 0xBF29833040000000, float 0x3F81103880000000)
  %178 = tail call float @llvm.fmuladd.f32(float %176, float %177, float 0xBFC55553A0000000)
  %179 = fmul float %176, %178
  %180 = tail call float @llvm.fmuladd.f32(float %174, float %179, float %174)
  %181 = tail call float @llvm.fmuladd.f32(float %176, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %182 = tail call float @llvm.fmuladd.f32(float %176, float %181, float 0x3FA5557EE0000000)
  %183 = tail call float @llvm.fmuladd.f32(float %176, float %182, float 0xBFE0000080000000)
  %184 = tail call float @llvm.fmuladd.f32(float %176, float %183, float 1.000000e+00)
  %185 = fneg float %180
  %186 = and i32 %175, 1
  %187 = icmp eq i32 %186, 0
  %188 = select i1 %187, float %184, float %185
  %189 = bitcast float %188 to i32
  %190 = shl i32 %175, 30
  %191 = and i32 %190, -2147483648
  %192 = xor i32 %191, %189
  %193 = bitcast i32 %192 to float
  %194 = tail call i1 @llvm.amdgcn.class.f32(float %58, i32 504)
  %195 = fadd contract float %193, 1.000000e+00
  %196 = select i1 %194, float %195, float 0x7FF8000000000000
  %197 = fcmp olt float %196, 0x39F0000000000000
  %198 = select i1 %197, float 0x41F0000000000000, float 1.000000e+00
  %199 = fmul float %196, %198
  %200 = tail call float @llvm.sqrt.f32(float %199)
  %201 = bitcast float %200 to i32
  %202 = add nsw i32 %201, -1
  %203 = bitcast i32 %202 to float
  %204 = add nsw i32 %201, 1
  %205 = bitcast i32 %204 to float
  %206 = tail call i1 @llvm.amdgcn.class.f32(float %199, i32 608)
  %207 = select i1 %197, float 0x3EF0000000000000, float 1.000000e+00
  %208 = fneg float %205
  %209 = tail call float @llvm.fma.f32(float %208, float %200, float %199)
  %210 = fcmp ogt float %209, 0.000000e+00
  %211 = fneg float %203
  %212 = tail call float @llvm.fma.f32(float %211, float %200, float %199)
  %213 = fcmp ole float %212, 0.000000e+00
  %214 = select i1 %213, float %203, float %200
  %215 = select i1 %210, float %205, float %214
  %216 = fmul float %207, %215
  %217 = select i1 %206, float %199, float %216
  br label %218

218:                                              ; preds = %173, %21
  %219 = phi float [ %56, %21 ], [ %217, %173 ]
  %220 = fadd contract float %18, %219
  store float %220, float addrspace(1)* %17, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = !{i32 0, i32 33}
