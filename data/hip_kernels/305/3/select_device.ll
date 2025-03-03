; ModuleID = '../data/hip_kernels/305/3/main.cu'
source_filename = "../data/hip_kernels/305/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@position = protected local_unnamed_addr addrspace(1) externally_initialized global i32 0, align 4
@largest = protected addrspace(1) externally_initialized global i32 0, align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (i32 addrspace(1)* @largest to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6selectPii(i32 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = sitofp i32 %1 to double
  %4 = tail call double @llvm.amdgcn.frexp.mant.f64(double %3)
  %5 = fcmp olt double %4, 0x3FE5555555555555
  %6 = zext i1 %5 to i32
  %7 = tail call double @llvm.amdgcn.ldexp.f64(double %4, i32 %6)
  %8 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %3)
  %9 = sub nsw i32 %8, %6
  %10 = fadd double %7, -1.000000e+00
  %11 = fadd double %7, 1.000000e+00
  %12 = fadd double %11, -1.000000e+00
  %13 = fsub double %7, %12
  %14 = tail call double @llvm.amdgcn.rcp.f64(double %11)
  %15 = fneg double %11
  %16 = tail call double @llvm.fma.f64(double %15, double %14, double 1.000000e+00)
  %17 = tail call double @llvm.fma.f64(double %16, double %14, double %14)
  %18 = tail call double @llvm.fma.f64(double %15, double %17, double 1.000000e+00)
  %19 = tail call double @llvm.fma.f64(double %18, double %17, double %17)
  %20 = fmul double %10, %19
  %21 = fmul double %11, %20
  %22 = fneg double %21
  %23 = tail call double @llvm.fma.f64(double %20, double %11, double %22)
  %24 = tail call double @llvm.fma.f64(double %20, double %13, double %23)
  %25 = fadd double %21, %24
  %26 = fsub double %25, %21
  %27 = fsub double %24, %26
  %28 = fsub double %10, %25
  %29 = fsub double %10, %28
  %30 = fsub double %29, %25
  %31 = fsub double %30, %27
  %32 = fadd double %28, %31
  %33 = fmul double %19, %32
  %34 = fadd double %20, %33
  %35 = fsub double %34, %20
  %36 = fsub double %33, %35
  %37 = fmul double %34, %34
  %38 = tail call double @llvm.fma.f64(double %37, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %39 = tail call double @llvm.fma.f64(double %37, double %38, double 0x3FC7474DD7F4DF2E)
  %40 = tail call double @llvm.fma.f64(double %37, double %39, double 0x3FCC71C016291751)
  %41 = tail call double @llvm.fma.f64(double %37, double %40, double 0x3FD249249B27ACF1)
  %42 = tail call double @llvm.fma.f64(double %37, double %41, double 0x3FD99999998EF7B6)
  %43 = tail call double @llvm.fma.f64(double %37, double %42, double 0x3FE5555555555780)
  %44 = tail call double @llvm.amdgcn.ldexp.f64(double %34, i32 1)
  %45 = tail call double @llvm.amdgcn.ldexp.f64(double %36, i32 1)
  %46 = fmul double %34, %37
  %47 = fmul double %46, %43
  %48 = fadd double %44, %47
  %49 = fsub double %48, %44
  %50 = fsub double %47, %49
  %51 = fadd double %45, %50
  %52 = fadd double %48, %51
  %53 = fsub double %52, %48
  %54 = fsub double %51, %53
  %55 = sitofp i32 %9 to double
  %56 = fmul double %52, 0x3FF71547652B82FE
  %57 = fneg double %56
  %58 = tail call double @llvm.fma.f64(double %52, double 0x3FF71547652B82FE, double %57)
  %59 = tail call double @llvm.fma.f64(double %54, double 0x3FF71547652B82FE, double %58)
  %60 = tail call double @llvm.fma.f64(double %52, double 0x3C7777D0FFDA0D24, double %59)
  %61 = fadd double %56, %60
  %62 = fsub double %61, %56
  %63 = fsub double %60, %62
  %64 = fadd double %61, %55
  %65 = fsub double %64, %55
  %66 = fsub double %65, %64
  %67 = fadd double %66, %55
  %68 = fsub double %61, %65
  %69 = fadd double %68, %67
  %70 = fadd double %63, %69
  %71 = fadd double %64, %70
  %72 = tail call double @llvm.fabs.f64(double %3) #4
  %73 = fcmp oeq double %72, 0x7FF0000000000000
  %74 = select i1 %73, double %3, double %71
  %75 = icmp slt i32 %1, 0
  %76 = select i1 %75, double 0x7FF8000000000000, double %74
  %77 = icmp eq i32 %1, 0
  %78 = select i1 %77, double 0xFFF0000000000000, double %76
  %79 = tail call double @llvm.ceil.f64(double %78)
  %80 = fptosi double %79 to i32
  %81 = icmp sgt i32 %80, 0
  br i1 %81, label %82, label %167

82:                                               ; preds = %2
  %83 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %84 = getelementptr i8, i8 addrspace(4)* %83, i64 4
  %85 = bitcast i8 addrspace(4)* %84 to i16 addrspace(4)*
  %86 = load i16, i16 addrspace(4)* %85, align 4, !range !4, !invariant.load !5
  %87 = zext i16 %86 to i32
  %88 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %89 = mul i32 %88, %87
  %90 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %91 = add i32 %89, %90
  %92 = shl nsw i32 %91, 1
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %93
  %95 = add nuw nsw i32 %92, 1
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %96
  %98 = sext i32 %91 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %98
  %100 = and i32 %80, 3
  %101 = icmp ult i32 %80, 4
  br i1 %101, label %149, label %102

102:                                              ; preds = %82
  %103 = and i32 %80, -4
  br label %104

104:                                              ; preds = %146, %102
  %105 = phi i32 [ %1, %102 ], [ %140, %146 ]
  %106 = phi i32 [ 0, %102 ], [ %147, %146 ]
  %107 = sitofp i32 %105 to double
  %108 = fmul contract double %107, 5.000000e-01
  %109 = tail call double @llvm.ceil.f64(double %108)
  %110 = fptosi double %109 to i32
  %111 = icmp slt i32 %91, %110
  br i1 %111, label %112, label %116

112:                                              ; preds = %104
  %113 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !7
  %114 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !7
  %115 = tail call i32 @llvm.smax.i32(i32 %113, i32 %114)
  store i32 %115, i32 addrspace(1)* %99, align 4, !tbaa !7
  br label %116

116:                                              ; preds = %104, %112
  %117 = sitofp i32 %110 to double
  %118 = fmul contract double %117, 5.000000e-01
  %119 = tail call double @llvm.ceil.f64(double %118)
  %120 = fptosi double %119 to i32
  %121 = icmp slt i32 %91, %120
  br i1 %121, label %122, label %126

122:                                              ; preds = %116
  %123 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !7
  %124 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !7
  %125 = tail call i32 @llvm.smax.i32(i32 %123, i32 %124)
  store i32 %125, i32 addrspace(1)* %99, align 4, !tbaa !7
  br label %126

126:                                              ; preds = %122, %116
  %127 = sitofp i32 %120 to double
  %128 = fmul contract double %127, 5.000000e-01
  %129 = tail call double @llvm.ceil.f64(double %128)
  %130 = fptosi double %129 to i32
  %131 = icmp slt i32 %91, %130
  br i1 %131, label %132, label %136

132:                                              ; preds = %126
  %133 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !7
  %134 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !7
  %135 = tail call i32 @llvm.smax.i32(i32 %133, i32 %134)
  store i32 %135, i32 addrspace(1)* %99, align 4, !tbaa !7
  br label %136

136:                                              ; preds = %132, %126
  %137 = sitofp i32 %130 to double
  %138 = fmul contract double %137, 5.000000e-01
  %139 = tail call double @llvm.ceil.f64(double %138)
  %140 = fptosi double %139 to i32
  %141 = icmp slt i32 %91, %140
  br i1 %141, label %142, label %146

142:                                              ; preds = %136
  %143 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !7
  %144 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !7
  %145 = tail call i32 @llvm.smax.i32(i32 %143, i32 %144)
  store i32 %145, i32 addrspace(1)* %99, align 4, !tbaa !7
  br label %146

146:                                              ; preds = %142, %136
  %147 = add i32 %106, 4
  %148 = icmp eq i32 %147, %103
  br i1 %148, label %149, label %104, !llvm.loop !11

149:                                              ; preds = %146, %82
  %150 = phi i32 [ %1, %82 ], [ %140, %146 ]
  %151 = icmp eq i32 %100, 0
  br i1 %151, label %167, label %152

152:                                              ; preds = %149, %164
  %153 = phi i32 [ %158, %164 ], [ %150, %149 ]
  %154 = phi i32 [ %165, %164 ], [ 0, %149 ]
  %155 = sitofp i32 %153 to double
  %156 = fmul contract double %155, 5.000000e-01
  %157 = tail call double @llvm.ceil.f64(double %156)
  %158 = fptosi double %157 to i32
  %159 = icmp slt i32 %91, %158
  br i1 %159, label %160, label %164

160:                                              ; preds = %152
  %161 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !7
  %162 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !7
  %163 = tail call i32 @llvm.smax.i32(i32 %161, i32 %162)
  store i32 %163, i32 addrspace(1)* %99, align 4, !tbaa !7
  br label %164

164:                                              ; preds = %160, %152
  %165 = add i32 %154, 1
  %166 = icmp eq i32 %165, %100
  br i1 %166, label %167, label %152, !llvm.loop !13

167:                                              ; preds = %149, %164, %2
  %168 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !7
  store i32 %168, i32 addrspace(1)* @largest, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.ceil.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { readnone }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
