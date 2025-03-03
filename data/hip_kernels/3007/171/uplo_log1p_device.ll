; ModuleID = '../data/hip_kernels/3007/171/main.cu'
source_filename = "../data/hip_kernels/3007/171/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10uplo_log1piiiPKfiiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
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
  br i1 %29, label %30, label %165

30:                                               ; preds = %9
  %31 = icmp eq i32 %1, 132
  %32 = mul nsw i32 %18, %2
  %33 = mul nsw i32 %26, %2
  %34 = icmp sgt i32 %32, %33
  %35 = icmp sge i32 %32, %33
  %36 = select i1 %31, i1 %34, i1 %35
  br i1 %36, label %37, label %165

37:                                               ; preds = %30
  %38 = add nsw i32 %18, %4
  %39 = mul nsw i32 %26, %5
  %40 = add nsw i32 %38, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fadd float %43, 1.000000e+00
  %45 = fadd float %44, -1.000000e+00
  %46 = fsub float %45, %44
  %47 = fadd float %46, 1.000000e+00
  %48 = fsub float %43, %45
  %49 = fadd float %48, %47
  %50 = tail call float @llvm.amdgcn.frexp.mant.f32(float %44)
  %51 = fcmp olt float %50, 0x3FE5555560000000
  %52 = sext i1 %51 to i32
  %53 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %44)
  %54 = add i32 %53, %52
  %55 = sub nsw i32 0, %54
  %56 = tail call float @llvm.amdgcn.ldexp.f32(float %44, i32 %55)
  %57 = tail call float @llvm.amdgcn.ldexp.f32(float %49, i32 %55)
  %58 = fadd float %56, -1.000000e+00
  %59 = fadd float %58, 1.000000e+00
  %60 = fsub float %56, %59
  %61 = fadd float %57, %60
  %62 = fadd float %58, %61
  %63 = fsub float %62, %58
  %64 = fsub float %61, %63
  %65 = fadd float %56, 1.000000e+00
  %66 = fadd float %65, -1.000000e+00
  %67 = fsub float %56, %66
  %68 = fadd float %57, %67
  %69 = fadd float %65, %68
  %70 = fsub float %69, %65
  %71 = fsub float %68, %70
  %72 = tail call float @llvm.amdgcn.rcp.f32(float %69)
  %73 = fmul float %62, %72
  %74 = fmul float %69, %73
  %75 = fneg float %74
  %76 = tail call float @llvm.fma.f32(float %73, float %69, float %75)
  %77 = tail call float @llvm.fma.f32(float %73, float %71, float %76)
  %78 = fadd float %74, %77
  %79 = fsub float %78, %74
  %80 = fsub float %77, %79
  %81 = fsub float %62, %78
  %82 = fsub float %62, %81
  %83 = fsub float %82, %78
  %84 = fadd float %64, %83
  %85 = fsub float %84, %80
  %86 = fadd float %81, %85
  %87 = fmul float %72, %86
  %88 = fmul float %69, %87
  %89 = fneg float %88
  %90 = tail call float @llvm.fma.f32(float %87, float %69, float %89)
  %91 = tail call float @llvm.fma.f32(float %87, float %71, float %90)
  %92 = fsub float %86, %81
  %93 = fsub float %85, %92
  %94 = fadd float %88, %91
  %95 = fsub float %94, %88
  %96 = fsub float %91, %95
  %97 = fsub float %86, %94
  %98 = fsub float %86, %97
  %99 = fsub float %98, %94
  %100 = fadd float %93, %99
  %101 = fsub float %100, %96
  %102 = fadd float %97, %101
  %103 = fmul float %72, %102
  %104 = fadd float %73, %87
  %105 = fsub float %104, %73
  %106 = fsub float %87, %105
  %107 = fadd float %106, %103
  %108 = fadd float %104, %107
  %109 = fmul float %108, %108
  %110 = tail call float @llvm.fmuladd.f32(float %109, float 0x3FD36DB580000000, float 0x3FD992B460000000)
  %111 = tail call float @llvm.fmuladd.f32(float %109, float %110, float 0x3FE5555B40000000)
  %112 = sitofp i32 %54 to float
  %113 = fmul float %112, 0x3FE62E4300000000
  %114 = fneg float %113
  %115 = tail call float @llvm.fma.f32(float %112, float 0x3FE62E4300000000, float %114)
  %116 = tail call float @llvm.fma.f32(float %112, float 0xBE205C6100000000, float %115)
  %117 = fsub float %108, %104
  %118 = fsub float %107, %117
  %119 = fadd float %113, %116
  %120 = fsub float %119, %113
  %121 = fsub float %116, %120
  %122 = tail call float @llvm.amdgcn.ldexp.f32(float %108, i32 1)
  %123 = tail call float @llvm.amdgcn.ldexp.f32(float %118, i32 1)
  %124 = fmul float %108, %109
  %125 = fmul float %124, %111
  %126 = fadd float %122, %125
  %127 = fsub float %126, %122
  %128 = fsub float %125, %127
  %129 = fadd float %123, %128
  %130 = fadd float %126, %129
  %131 = fsub float %130, %126
  %132 = fsub float %129, %131
  %133 = fadd float %119, %130
  %134 = fsub float %133, %119
  %135 = fsub float %133, %134
  %136 = fsub float %119, %135
  %137 = fsub float %130, %134
  %138 = fadd float %137, %136
  %139 = fadd float %121, %132
  %140 = fsub float %139, %121
  %141 = fsub float %139, %140
  %142 = fsub float %121, %141
  %143 = fsub float %132, %140
  %144 = fadd float %143, %142
  %145 = fadd float %139, %138
  %146 = fadd float %133, %145
  %147 = fsub float %146, %133
  %148 = fsub float %145, %147
  %149 = fadd float %144, %148
  %150 = fadd float %146, %149
  %151 = tail call i1 @llvm.amdgcn.class.f32(float %43, i32 512)
  %152 = select i1 %151, float %43, float %150
  %153 = fcmp olt float %43, -1.000000e+00
  %154 = select i1 %153, float 0x7FF8000000000000, float %152
  %155 = fcmp oeq float %43, -1.000000e+00
  %156 = select i1 %155, float 0xFFF0000000000000, float %154
  %157 = tail call float @llvm.fabs.f32(float %43)
  %158 = fcmp olt float %157, 0x3E70000000000000
  %159 = select i1 %158, float %43, float %156
  %160 = add nsw i32 %18, %7
  %161 = mul nsw i32 %26, %8
  %162 = add nsw i32 %160, %161
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %6, i64 %163
  store float %159, float addrspace(1)* %164, align 4, !tbaa !7
  br label %165

165:                                              ; preds = %9, %37, %30
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
