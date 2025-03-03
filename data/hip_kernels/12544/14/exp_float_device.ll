; ModuleID = '../data/hip_kernels/12544/14/main.cu'
source_filename = "../data/hip_kernels/12544/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @exp_float(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %26

19:                                               ; preds = %5
  %20 = udiv i32 %14, %11
  %21 = mul i32 %20, %11
  %22 = icmp ugt i32 %14, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %11
  br label %27

26:                                               ; preds = %180, %5
  ret void

27:                                               ; preds = %19, %180
  %28 = phi i32 [ %17, %19 ], [ %181, %180 ]
  %29 = icmp slt i32 %28, %1
  br i1 %29, label %180, label %30

30:                                               ; preds = %27
  %31 = srem i32 %28, %3
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %180

33:                                               ; preds = %30
  %34 = sext i32 %28 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %37 = tail call float @llvm.fabs.f32(float %36)
  %38 = fcmp olt float %37, 1.310720e+05
  br i1 %38, label %39, label %47

39:                                               ; preds = %33
  %40 = fmul float %37, 0x3FE45F3060000000
  %41 = tail call float @llvm.rint.f32(float %40)
  %42 = tail call float @llvm.fma.f32(float %41, float 0xBFF921FB40000000, float %37)
  %43 = tail call float @llvm.fma.f32(float %41, float 0xBE74442D00000000, float %42)
  %44 = tail call float @llvm.fma.f32(float %41, float 0xBCF8469880000000, float %43)
  %45 = fptosi float %41 to i32
  %46 = bitcast float %37 to i32
  br label %153

47:                                               ; preds = %33
  %48 = bitcast float %37 to i32
  %49 = lshr i32 %48, 23
  %50 = and i32 %48, 8388607
  %51 = or i32 %50, 8388608
  %52 = zext i32 %51 to i64
  %53 = mul nuw nsw i64 %52, 4266746795
  %54 = trunc i64 %53 to i32
  %55 = lshr i64 %53, 32
  %56 = mul nuw nsw i64 %52, 1011060801
  %57 = add nuw nsw i64 %55, %56
  %58 = trunc i64 %57 to i32
  %59 = lshr i64 %57, 32
  %60 = mul nuw nsw i64 %52, 3680671129
  %61 = add nuw nsw i64 %59, %60
  %62 = trunc i64 %61 to i32
  %63 = lshr i64 %61, 32
  %64 = mul nuw nsw i64 %52, 4113882560
  %65 = add nuw nsw i64 %63, %64
  %66 = trunc i64 %65 to i32
  %67 = lshr i64 %65, 32
  %68 = mul nuw nsw i64 %52, 4230436817
  %69 = add nuw nsw i64 %67, %68
  %70 = trunc i64 %69 to i32
  %71 = lshr i64 %69, 32
  %72 = mul nuw nsw i64 %52, 1313084713
  %73 = add nuw nsw i64 %71, %72
  %74 = trunc i64 %73 to i32
  %75 = lshr i64 %73, 32
  %76 = mul nuw nsw i64 %52, 2734261102
  %77 = add nuw nsw i64 %75, %76
  %78 = trunc i64 %77 to i32
  %79 = lshr i64 %77, 32
  %80 = trunc i64 %79 to i32
  %81 = add nsw i32 %49, -120
  %82 = icmp ugt i32 %81, 63
  %83 = select i1 %82, i32 %74, i32 %80
  %84 = select i1 %82, i32 %70, i32 %78
  %85 = select i1 %82, i32 %66, i32 %74
  %86 = select i1 %82, i32 %62, i32 %70
  %87 = select i1 %82, i32 %58, i32 %66
  %88 = select i1 %82, i32 %54, i32 %62
  %89 = select i1 %82, i32 -64, i32 0
  %90 = add nsw i32 %89, %81
  %91 = icmp ugt i32 %90, 31
  %92 = select i1 %91, i32 %84, i32 %83
  %93 = select i1 %91, i32 %85, i32 %84
  %94 = select i1 %91, i32 %86, i32 %85
  %95 = select i1 %91, i32 %87, i32 %86
  %96 = select i1 %91, i32 %88, i32 %87
  %97 = select i1 %91, i32 -32, i32 0
  %98 = add nsw i32 %97, %90
  %99 = icmp ugt i32 %98, 31
  %100 = select i1 %99, i32 %93, i32 %92
  %101 = select i1 %99, i32 %94, i32 %93
  %102 = select i1 %99, i32 %95, i32 %94
  %103 = select i1 %99, i32 %96, i32 %95
  %104 = select i1 %99, i32 -32, i32 0
  %105 = add nsw i32 %104, %98
  %106 = icmp eq i32 %105, 0
  %107 = sub nsw i32 32, %105
  %108 = tail call i32 @llvm.fshr.i32(i32 %100, i32 %101, i32 %107)
  %109 = tail call i32 @llvm.fshr.i32(i32 %101, i32 %102, i32 %107)
  %110 = tail call i32 @llvm.fshr.i32(i32 %102, i32 %103, i32 %107)
  %111 = select i1 %106, i32 %100, i32 %108
  %112 = select i1 %106, i32 %101, i32 %109
  %113 = select i1 %106, i32 %102, i32 %110
  %114 = lshr i32 %111, 29
  %115 = tail call i32 @llvm.fshl.i32(i32 %111, i32 %112, i32 2)
  %116 = tail call i32 @llvm.fshl.i32(i32 %112, i32 %113, i32 2)
  %117 = tail call i32 @llvm.fshl.i32(i32 %113, i32 %103, i32 2)
  %118 = and i32 %114, 1
  %119 = sub nsw i32 0, %118
  %120 = shl i32 %114, 31
  %121 = xor i32 %115, %119
  %122 = xor i32 %116, %119
  %123 = xor i32 %117, %119
  %124 = tail call i32 @llvm.ctlz.i32(i32 %121, i1 false), !range !20
  %125 = sub nsw i32 31, %124
  %126 = tail call i32 @llvm.fshr.i32(i32 %121, i32 %122, i32 %125)
  %127 = tail call i32 @llvm.fshr.i32(i32 %122, i32 %123, i32 %125)
  %128 = shl nuw nsw i32 %124, 23
  %129 = sub nuw nsw i32 1056964608, %128
  %130 = lshr i32 %126, 9
  %131 = or i32 %130, %129
  %132 = or i32 %131, %120
  %133 = bitcast i32 %132 to float
  %134 = tail call i32 @llvm.fshl.i32(i32 %126, i32 %127, i32 23)
  %135 = tail call i32 @llvm.ctlz.i32(i32 %134, i1 false), !range !20
  %136 = fmul float %133, 0x3FF921FB40000000
  %137 = add nuw nsw i32 %135, %124
  %138 = shl nuw nsw i32 %137, 23
  %139 = sub nuw nsw i32 855638016, %138
  %140 = sub nsw i32 31, %135
  %141 = tail call i32 @llvm.fshr.i32(i32 %134, i32 %127, i32 %140)
  %142 = lshr i32 %141, 9
  %143 = or i32 %139, %142
  %144 = or i32 %143, %120
  %145 = bitcast i32 %144 to float
  %146 = fneg float %136
  %147 = tail call float @llvm.fma.f32(float %133, float 0x3FF921FB40000000, float %146)
  %148 = tail call float @llvm.fma.f32(float %133, float 0x3E74442D00000000, float %147)
  %149 = tail call float @llvm.fma.f32(float %145, float 0x3FF921FB40000000, float %148)
  %150 = fadd float %136, %149
  %151 = lshr i32 %111, 30
  %152 = add nuw nsw i32 %118, %151
  br label %153

153:                                              ; preds = %39, %47
  %154 = phi i32 [ %46, %39 ], [ %48, %47 ]
  %155 = phi float [ %44, %39 ], [ %150, %47 ]
  %156 = phi i32 [ %45, %39 ], [ %152, %47 ]
  %157 = fmul float %155, %155
  %158 = tail call float @llvm.fmuladd.f32(float %157, float 0xBF29833040000000, float 0x3F81103880000000)
  %159 = tail call float @llvm.fmuladd.f32(float %157, float %158, float 0xBFC55553A0000000)
  %160 = fmul float %157, %159
  %161 = tail call float @llvm.fmuladd.f32(float %155, float %160, float %155)
  %162 = tail call float @llvm.fmuladd.f32(float %157, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %163 = tail call float @llvm.fmuladd.f32(float %157, float %162, float 0x3FA5557EE0000000)
  %164 = tail call float @llvm.fmuladd.f32(float %157, float %163, float 0xBFE0000080000000)
  %165 = tail call float @llvm.fmuladd.f32(float %157, float %164, float 1.000000e+00)
  %166 = and i32 %156, 1
  %167 = icmp eq i32 %166, 0
  %168 = select i1 %167, float %161, float %165
  %169 = bitcast float %168 to i32
  %170 = shl i32 %156, 30
  %171 = and i32 %170, -2147483648
  %172 = bitcast float %36 to i32
  %173 = xor i32 %154, %172
  %174 = xor i32 %173, %171
  %175 = xor i32 %174, %169
  %176 = bitcast i32 %175 to float
  %177 = tail call i1 @llvm.amdgcn.class.f32(float %37, i32 504)
  %178 = select i1 %177, float %176, float 0x7FF8000000000000
  %179 = getelementptr inbounds float, float addrspace(1)* %4, i64 %34
  store float %178, float addrspace(1)* %179, align 4, !tbaa !16
  br label %180

180:                                              ; preds = %27, %30, %153
  %181 = add i32 %25, %28
  %182 = icmp slt i32 %181, %0
  br i1 %182, label %27, label %26, !llvm.loop !21
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{i32 0, i32 33}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
