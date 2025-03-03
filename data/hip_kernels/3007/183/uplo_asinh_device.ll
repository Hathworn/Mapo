; ModuleID = '../data/hip_kernels/3007/183/main.cu'
source_filename = "../data/hip_kernels/3007/183/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10uplo_asinhiiiPKfiiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %18, %0
  %28 = icmp slt i32 %26, %0
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %203

30:                                               ; preds = %9
  %31 = icmp eq i32 %1, 132
  %32 = mul nsw i32 %18, %2
  %33 = mul nsw i32 %26, %2
  %34 = icmp sgt i32 %32, %33
  %35 = icmp sge i32 %32, %33
  %36 = select i1 %31, i1 %34, i1 %35
  br i1 %36, label %37, label %203

37:                                               ; preds = %30
  %38 = add nsw i32 %18, %4
  %39 = mul nsw i32 %26, %5
  %40 = add nsw i32 %38, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = tail call float @llvm.fabs.f32(float %43)
  %45 = fcmp oge float %44, 0x43F0000000000000
  %46 = select i1 %45, float 0x3BF0000000000000, float 1.000000e+00
  %47 = fmul float %44, %46
  %48 = fmul float %47, %47
  %49 = fneg float %48
  %50 = tail call float @llvm.fma.f32(float %47, float %47, float %49)
  %51 = select i1 %45, float 0x37F0000000000000, float 1.000000e+00
  %52 = fadd float %51, %48
  %53 = fsub float %52, %48
  %54 = fsub float %52, %53
  %55 = fsub float %48, %54
  %56 = fsub float %51, %53
  %57 = fadd float %56, %55
  %58 = fadd float %50, %57
  %59 = fadd float %52, %58
  %60 = tail call float @llvm.sqrt.f32(float %59)
  %61 = fmul float %60, %60
  %62 = fneg float %61
  %63 = tail call float @llvm.fma.f32(float %60, float %60, float %62)
  %64 = fsub float %59, %52
  %65 = fsub float %58, %64
  %66 = fsub float %59, %61
  %67 = fsub float %59, %66
  %68 = fsub float %67, %61
  %69 = fadd float %65, %68
  %70 = fsub float %69, %63
  %71 = fadd float %66, %70
  %72 = fmul float %60, 2.000000e+00
  %73 = tail call float @llvm.amdgcn.rcp.f32(float %72)
  %74 = fmul float %73, %71
  %75 = fcmp oeq float %59, 0.000000e+00
  %76 = select i1 %75, float 0.000000e+00, float %74
  %77 = fadd float %60, %76
  %78 = fsub float %77, %60
  %79 = fsub float %76, %78
  %80 = fadd float %47, %77
  %81 = fsub float %80, %47
  %82 = fsub float %80, %81
  %83 = fsub float %47, %82
  %84 = fsub float %77, %81
  %85 = fadd float %84, %83
  %86 = fadd float %79, %85
  %87 = fadd float %80, %86
  %88 = fsub float %87, %80
  %89 = fsub float %86, %88
  %90 = select i1 %45, i32 64, i32 0
  %91 = tail call float @llvm.amdgcn.frexp.mant.f32(float %87)
  %92 = fcmp olt float %91, 0x3FE5555560000000
  %93 = sext i1 %92 to i32
  %94 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %87)
  %95 = add i32 %94, %93
  %96 = sub nsw i32 0, %95
  %97 = tail call float @llvm.amdgcn.ldexp.f32(float %87, i32 %96)
  %98 = tail call float @llvm.amdgcn.ldexp.f32(float %89, i32 %96)
  %99 = fadd float %97, -1.000000e+00
  %100 = fadd float %99, 1.000000e+00
  %101 = fsub float %97, %100
  %102 = fadd float %98, %101
  %103 = fadd float %99, %102
  %104 = fsub float %103, %99
  %105 = fsub float %102, %104
  %106 = fadd float %97, 1.000000e+00
  %107 = fadd float %106, -1.000000e+00
  %108 = fsub float %97, %107
  %109 = fadd float %98, %108
  %110 = fadd float %106, %109
  %111 = fsub float %110, %106
  %112 = fsub float %109, %111
  %113 = tail call float @llvm.amdgcn.rcp.f32(float %110)
  %114 = fmul float %103, %113
  %115 = fmul float %110, %114
  %116 = fneg float %115
  %117 = tail call float @llvm.fma.f32(float %114, float %110, float %116)
  %118 = tail call float @llvm.fma.f32(float %114, float %112, float %117)
  %119 = fadd float %115, %118
  %120 = fsub float %119, %115
  %121 = fsub float %118, %120
  %122 = fsub float %103, %119
  %123 = fsub float %103, %122
  %124 = fsub float %123, %119
  %125 = fadd float %105, %124
  %126 = fsub float %125, %121
  %127 = fadd float %122, %126
  %128 = fmul float %113, %127
  %129 = fmul float %110, %128
  %130 = fneg float %129
  %131 = tail call float @llvm.fma.f32(float %128, float %110, float %130)
  %132 = tail call float @llvm.fma.f32(float %128, float %112, float %131)
  %133 = fsub float %127, %122
  %134 = fsub float %126, %133
  %135 = fadd float %129, %132
  %136 = fsub float %135, %129
  %137 = fsub float %132, %136
  %138 = fsub float %127, %135
  %139 = fsub float %127, %138
  %140 = fsub float %139, %135
  %141 = fadd float %134, %140
  %142 = fsub float %141, %137
  %143 = fadd float %138, %142
  %144 = fmul float %113, %143
  %145 = fadd float %114, %128
  %146 = fsub float %145, %114
  %147 = fsub float %128, %146
  %148 = fadd float %147, %144
  %149 = fadd float %145, %148
  %150 = fmul float %149, %149
  %151 = tail call float @llvm.fmuladd.f32(float %150, float 0x3FD36DB580000000, float 0x3FD992B460000000)
  %152 = tail call float @llvm.fmuladd.f32(float %150, float %151, float 0x3FE5555B40000000)
  %153 = add nsw i32 %95, %90
  %154 = sitofp i32 %153 to float
  %155 = fmul float %154, 0x3FE62E4300000000
  %156 = fneg float %155
  %157 = tail call float @llvm.fma.f32(float %154, float 0x3FE62E4300000000, float %156)
  %158 = tail call float @llvm.fma.f32(float %154, float 0xBE205C6100000000, float %157)
  %159 = fsub float %149, %145
  %160 = fsub float %148, %159
  %161 = fadd float %155, %158
  %162 = fsub float %161, %155
  %163 = fsub float %158, %162
  %164 = tail call float @llvm.amdgcn.ldexp.f32(float %149, i32 1)
  %165 = tail call float @llvm.amdgcn.ldexp.f32(float %160, i32 1)
  %166 = fmul float %149, %150
  %167 = fmul float %166, %152
  %168 = fadd float %164, %167
  %169 = fsub float %168, %164
  %170 = fsub float %167, %169
  %171 = fadd float %165, %170
  %172 = fadd float %168, %171
  %173 = fsub float %172, %168
  %174 = fsub float %171, %173
  %175 = fadd float %161, %172
  %176 = fsub float %175, %161
  %177 = fsub float %175, %176
  %178 = fsub float %161, %177
  %179 = fsub float %172, %176
  %180 = fadd float %179, %178
  %181 = fadd float %163, %174
  %182 = fsub float %181, %163
  %183 = fsub float %181, %182
  %184 = fsub float %163, %183
  %185 = fsub float %174, %182
  %186 = fadd float %185, %184
  %187 = fadd float %181, %180
  %188 = fadd float %175, %187
  %189 = fsub float %188, %175
  %190 = fsub float %187, %189
  %191 = fadd float %186, %190
  %192 = fadd float %188, %191
  %193 = fcmp olt float %44, 0x3F30000000000000
  %194 = tail call i1 @llvm.amdgcn.class.f32(float %44, i32 512)
  %195 = select i1 %194, i1 true, i1 %193
  %196 = select i1 %195, float %44, float %192
  %197 = tail call float @llvm.copysign.f32(float %196, float %43)
  %198 = add nsw i32 %18, %7
  %199 = mul nsw i32 %26, %8
  %200 = add nsw i32 %198, %199
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %6, i64 %201
  store float %197, float addrspace(1)* %202, align 4, !tbaa !7
  br label %203

203:                                              ; preds = %9, %37, %30
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
